import 'package:flutter_bloc/flutter_bloc.dart';


class FoodCubit extends Cubit<String> {
  FoodCubit() : super("Pizza");

  void selectCategory(String category) {
    emit(category);
  }
}