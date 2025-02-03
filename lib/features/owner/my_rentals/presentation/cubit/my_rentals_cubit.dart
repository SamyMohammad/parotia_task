import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'my_rentals_state.dart';

class MyRentalsCubit extends Cubit<MyRentalsState> {
  MyRentalsCubit() : super(MyRentalsInitial());
}
