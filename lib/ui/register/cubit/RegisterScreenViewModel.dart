import 'dart:core';

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
  DateTime dateTime = DateTime(2023, 2, 1, 10, 20);

  bool isObscure = true;

  void register() async {
    if (forKey.currentState?.validate() == true) {
      emit(RegisterLoadingStates(LoadingMessage: 'Loading'));
     //  var either = await registerUseCase.invoke(
     //      {
     // "firstName":   firstName.text,
     //    lastName.text,
     //    email.text,
     //    password.text,
     //    confirmationPassword.text,
     //    dateTime.toString(),
     //    gender.text,
     //  });
      var either = await registerUseCase.invoke(registerParameters: {
        "firstName":firstName.text,
        "lastName":  lastName.text,
        "email":email.text,
        "password": password.text,
        "confirmPassword": confirmationPassword.text,
        "dateOfBirth": dateTime.toString(),
        "gender":gender.text
      });
      either.fold(
          (error) => {
                emit(RegisterErrorStates(Message: error.errorMessage)),
              },
          (response) => {
                print("success"),
                emit(RegisterSuccessStates(registerResponseEntity: response)),
              });
    }
  }
}
