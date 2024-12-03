import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<bool> {
  LoginCubit() : super(false);

  void login() async {

    emit(true); 
    await Future.delayed(const Duration(seconds: 10)); 
    
      emit(false); 
  
  }
}
