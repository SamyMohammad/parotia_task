import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:parotia_task/core/exceptions/firebase_failure.dart';
import 'package:parotia_task/core/firebase/firbase_result.dart';
import 'package:parotia_task/core/firebase/reservation_model.dart';

abstract class DatabaseCrudManager<T> {
  Stream<DatabaseResult<T>> create(T item);
  Stream<DatabaseResult<void>> delete(String id);
  Stream<QuerySnapshot<Map<String, dynamic>>> getAll();
  Stream<DatabaseResult<T>> getById(String id);
  Future update(T item);
}

class FirestoreCrudManager<T> implements DatabaseCrudManager<T> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String collectionPath;
  final T Function(DocumentSnapshot) fromFirestore;
  final Map<String, dynamic> Function(T) toFirestore;

  FirestoreCrudManager({
    required this.collectionPath,
    required this.fromFirestore,
    required this.toFirestore,
  });

  @override
  Stream<DatabaseResult<T>> create(T item) {
    final controller = StreamController<DatabaseResult<T>>();

    _firestore
        .collection(collectionPath)
        .add(toFirestore(item))
        .then((docRef) async {
      final docSnapshot = await docRef.get();
      controller.add(DatabaseResult.success(fromFirestore(docSnapshot)));
      controller.close();
    }).catchError((error) {
      controller.add(DatabaseResult.failure(
          DatabaseFailure(message: 'Failed to create item: ${error.toString()}')
              .message));
      controller.close();
    });

    return controller.stream;
  }

  @override
  Stream<DatabaseResult<void>> delete(String id) {
    final controller = StreamController<DatabaseResult<void>>();

    _firestore.collection(collectionPath).doc(id).delete().then((_) {
      controller.add(const DatabaseResult.success(null));
      controller.close();
    }).catchError((error) {
      controller.add(DatabaseResult.failure(
          DatabaseFailure(message: 'Failed to delete item: ${error.toString()}')
              .message));
      controller.close();
    });

    return controller.stream;
  }

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> getAll() {
    // final controller = StreamController<DatabaseResult<List<T>>>();

    return _firestore.collection(collectionPath).snapshots();
  }

  @override
  Stream<DatabaseResult<T>> getById(String id) {
    final controller = StreamController<DatabaseResult<T>>();

    _firestore.collection(collectionPath).doc(id).get().then((docSnapshot) {
      if (!docSnapshot.exists) {
        controller.add(DatabaseResult.failure(
            NotFoundFailure(message: 'Item with id $id not found').message));
      } else {
        controller.add(DatabaseResult.success(fromFirestore(docSnapshot)));
      }
      controller.close();
    }).catchError((error) {
      controller.add(DatabaseResult.failure(
          DatabaseFailure(message: 'Failed to fetch item: ${error.toString()}')
              .message));
      controller.close();
    });

    return controller.stream;
  }

  @override
  Future update(T item) async {
    // Assuming the item has an 'id' field
    final itemMap = toFirestore(item);
    // get the id of the doc
    final reservationModel = item as ReservationModel;

    await _firestore
        .collection(collectionPath)
        .doc(reservationModel.id ?? '')
        .update(itemMap);
  }

  // Optional: Add a method to watch real-time updates for a collection
  Stream<List<T>> watchCollection() {
    return _firestore.collection(collectionPath).snapshots().map(
        (snapshot) => snapshot.docs.map((doc) => fromFirestore(doc)).toList());
  }
}
