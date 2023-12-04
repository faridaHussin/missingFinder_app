import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:missing_finder1/ui/register/cubit/Register_States.dart';

class RegisterScreenViewModel extends Cubit<RegisterStates> {
  RegisterScreenViewModel() : super(RegisterInitialStates());
  var forKey = GlobalKey<FormState>();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController emailOrMobileNumber = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmationPassword = TextEditingController();
  bool isObscure = true;

  void register() {}
}
