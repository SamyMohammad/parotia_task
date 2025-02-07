import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:parotia_task/core/firebase/firabase_crud_manager.dart';
import 'package:parotia_task/core/firebase/reservation_model.dart';

class GetAllRentalsUseCase {
  final FirestoreCrudManager<ReservationModel> firestoreCrudManager;

  GetAllRentalsUseCase(this.firestoreCrudManager);

  Stream<QuerySnapshot<Map<String, dynamic>>> call() {
    return firestoreCrudManager.getAll();
  }
}
