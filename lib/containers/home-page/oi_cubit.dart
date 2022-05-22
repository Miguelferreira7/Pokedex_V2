import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'oi_state.dart';

class OiCubit extends Cubit<OiState> {
  OiCubit() : super(OiInitial());
}
