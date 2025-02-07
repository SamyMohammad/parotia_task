import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parotia_task/features/owner/my_rentals/domain/usecases/get_all_rental_use_case.dart';
import 'package:parotia_task/features/owner/my_rentals/presentation/cubit/my_rentals_state.dart';

class MyRentalsCubit extends Cubit<MyRentalsState> {
  final GetAllRentalsUseCase _getAllReservationsUseCase;

  MyRentalsCubit(this._getAllReservationsUseCase)
      : super(const MyRentalsState.initial());

  Stream<QuerySnapshot<Map<String, dynamic>>> fetchAllReservations() {
    final result = _getAllReservationsUseCase();
    return result;
  }
}
