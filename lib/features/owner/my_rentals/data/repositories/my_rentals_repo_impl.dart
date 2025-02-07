// import 'package:parotia_task/core/firebase/firabase_crud_manager.dart';
// import 'package:parotia_task/core/firebase/firbase_result.dart';
// import 'package:parotia_task/core/firebase/reservation_model.dart';
// import 'package:parotia_task/features/owner/my_rentals/domain/repositories/my_rentals_repo.dart';

// class MyRentalRepositoryImpl implements MyRentalRepository {
//   final FirestoreCrudManager<ReservationModel> _crudManager;

//   MyRentalRepositoryImpl()
//       : _crudManager = FirestoreCrudManager<ReservationModel>(
//           collectionPath: 'reservations',
//           fromFirestore: ReservationModel.fromFirestore,
//           toFirestore: (reservation) => reservation.toFirestore(),
//         );

//   @override
//   StragetAllRentals() {
//     return _crudManager.getAll()
//   }
// }
