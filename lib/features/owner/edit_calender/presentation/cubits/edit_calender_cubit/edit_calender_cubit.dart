import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'edit_calender_state.dart';

class EditCalenderCubit extends Cubit<EditCalenderState> {
  EditCalenderCubit() : super(EditCalenderInitial());
}
