import 'package:parotia_task/core/firebase/firbase_result.dart';
import 'package:parotia_task/core/firebase/reservation_model.dart';

abstract class MyRentalRepository {
  Stream<DatabaseResult<List<ReservationModel>>> getAllRentals();
}
