
import 'package:flutter_bloc/flutter_bloc.dart';

class NumberCubit extends Cubit<int> {
  NumberCubit() : super(1); 
  void newNumber(int number) => emit(number);
}