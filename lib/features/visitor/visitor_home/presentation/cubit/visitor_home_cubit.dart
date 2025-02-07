import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:parotia_task/features/owner/my_rentals/domain/usecases/get_all_rental_use_case.dart';

part 'visitor_home_state.dart';

class VisitorHomeCubit extends Cubit<VisitorHomeState> {
  final GetAllRentalsUseCase _getAllReservationsUseCase;

  VisitorHomeCubit(this._getAllReservationsUseCase)
      : super(VisitorHomeInitial());

  Stream<QuerySnapshot<Map<String, dynamic>>> fetchAllReservations() {
    final result = _getAllReservationsUseCase();
    return result;
  }
}
