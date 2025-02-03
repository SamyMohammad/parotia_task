import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'edit_price_state.dart';

class EditPriceCubit extends Cubit<EditPriceState> {
  EditPriceCubit() : super(EditPriceInitial());
}
