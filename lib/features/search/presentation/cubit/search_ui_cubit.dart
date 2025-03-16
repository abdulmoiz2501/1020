import 'package:flutter_bloc/flutter_bloc.dart';

class SearchUiCubit extends Cubit<bool> {
  SearchUiCubit() : super(false);

  void setKeyboardOpen(bool isOpen) {
    emit(isOpen);
  }
}
