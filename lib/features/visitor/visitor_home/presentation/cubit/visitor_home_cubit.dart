import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'visitor_home_state.dart';

class VisitorHomeCubit extends Cubit<VisitorHomeState> {
  VisitorHomeCubit() : super(VisitorHomeInitial());
}
