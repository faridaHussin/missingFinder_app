import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:missing_finder1/ui/register/cubit/Register_States.dart';

import '../../../domain/use_case/register_use_case.dart';

class RegisterScreenViewModel extends Cubit<RegisterStates> {
  RegisterUseCase registerUseCase;

  RegisterScreenViewModel({required this.registerUseCase})
      : super(RegisterInitialStates());
  var forKey = GlobalKey<FormState>();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmationPassword = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController dateOfBirth = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();
  bool isObscure = true;

  void register() async {
    if (forKey.currentState?.validate() == true) {
      emit(RegisterLoadingStates(LoadingMessage: 'Loading'));
      var either = await registerUseCase.invoke(
          firstName.text,
          lastName.text,
          email.text,
          password.text,
          confirmationPassword.text,
          dateOfBirth.text as DateTime,
          gender.text);
      either.fold(
          (error) => {
                emit(RegisterErrorStates(ErrorMessage: error.errorMessage)),
              },
          (response) => {
                emit(RegisterSuccessStates(resultEntity: response)),
              });
    }
  }
}
