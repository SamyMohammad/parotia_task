import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:parotia_task/core/exceptions/firebase_failure.dart';
import 'package:parotia_task/core/firebase/firbase_result.dart';

abstract class FirebaseCrudManager<T> {
  // Create operation
  Future<FirebaseResult<T>> create(T item);
  
  // Delete operations
  // Future<FirebaseResult<void>> delete(String id);
  Future<FirebaseResult<List<T>>> getAll();
  // Read operations
  Future<FirebaseResult<T>> getById(String id);
  
  // Future<FirebaseResult<List<T>>> getWhere({
  //   required Query Function(Query query) queryBuilder,
  // });
  // Future<FirebaseResult<void>> partialUpdate(
  //   String id, 
  //   Map<String, dynamic> updates
  // );
  
  // // Update operations
  // Future<FirebaseResult<T>> update(T item);
}
class FirestoreCrudManager<T> implements FirebaseCrudManager<T> {
  final FirebaseFirestore _firestore;
  final String collectionPath;
  final T Function(DocumentSnapshot) fromFirestore;
  final Map<String, dynamic> Function(T) toFirestore;

  FirestoreCrudManager({
    required FirebaseFirestore firestore,
    required this.collectionPath,
    required this.fromFirestore,
    required this.toFirestore,
  }) : _firestore = firestore;

  @override
  Future<FirebaseResult<T>> create(T item) async {
    try {
      final docRef = await _firestore
        .collection(collectionPath)
        .add(toFirestore(item));
      
      final docSnapshot = await docRef.get();
      return FirebaseResult.success(fromFirestore(docSnapshot));
    } catch (e) {
      return FirebaseResult.failure(DatabaseFailure(
        message: 'Failed to create item: ${e.toString()}'
      ).message);
    }
  }



  @override
  Future<FirebaseResult<List<T>>> getAll() async {
    try {
      final querySnapshot = await _firestore
        .collection(collectionPath)
        .get();
      
      final items = querySnapshot.docs
        .map((doc) => fromFirestore(doc))
        .toList();
      
      return FirebaseResult.success(items);
    } catch (e) {
      return FirebaseResult.failure(DatabaseFailure(
        message: 'Failed to fetch items: ${e.toString()}'
      ).message);
    }
  }

  @override
  Future<FirebaseResult<T>> getById(String id) async {
    try {
      final docSnapshot = await _firestore
        .collection(collectionPath)
        .doc(id)
        .get();
      
      if (!docSnapshot.exists) {
        return FirebaseResult.failure(NotFoundFailure(
          message: 'Item with id $id not found'
        ).message);
      }
      
      return FirebaseResult.success(fromFirestore(docSnapshot));
    } catch (e) {
      return FirebaseResult.failure(DatabaseFailure(
        message: 'Failed to fetch item: ${e.toString()}'
      ).message);
    }
  }

 




}
