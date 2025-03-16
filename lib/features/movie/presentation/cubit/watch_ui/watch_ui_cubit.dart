
import 'package:bloc/bloc.dart';

class WatchUiCubit extends Cubit<int> {
  WatchUiCubit() : super(0);

  void searchClick() => emit(1);
  void searchClose() => emit(0);
}
