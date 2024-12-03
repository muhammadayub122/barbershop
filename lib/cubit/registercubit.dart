import 'package:bloc/bloc.dart';

class PasswordVisibilityCubit extends Cubit<bool> {
  PasswordVisibilityCubit() : super(false); 


  void showpassword() => emit(!state);
}
