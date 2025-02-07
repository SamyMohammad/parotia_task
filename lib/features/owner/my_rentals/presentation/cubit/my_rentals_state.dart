import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/firebase/reservation_model.dart';

part 'my_rentals_state.freezed.dart';

@freezed
class MyRentalsState with _$MyRentalsState {
  const factory MyRentalsState.error(String message) = _Error;
  const factory MyRentalsState.initial() = _Initial;
  const factory MyRentalsState.loaded(List<ReservationModel> reservations) =
      _Loaded;
  const factory MyRentalsState.loading() = _Loading;
}
