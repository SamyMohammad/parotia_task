import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'edit_availability_state.dart';

class EditAvailabilityCubit extends Cubit<EditAvailabilityState> {
  EditAvailabilityCubit() : super(EditAvailabilityInitial());
}
