import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/use_case/register_use_case.dart';
import 'Activate_States.dart';

class ActivateScreenViewModel extends Cubit<ActivateStates> {
  ActivateAccountUseCase activateAccountUseCase;

  ActivateScreenViewModel({required this.activateAccountUseCase})
      : super(ActivateInitialStates());
  var forKey = GlobalKey<FormState>();

  TextEditingController pinCodeTextField = TextEditingController();

  void activateAccount() async {
    if (forKey.currentState?.validate() == true) {
      emit(ActivateLoadingStates(LoadingMessage: 'Loading'));
      var either = await activateAccountUseCase.invoke(pinCodeTextField.text);
      either.fold(
          (error) => {
                emit(ActivateErrorStates(ErrorMessage: error.errorMessage)),
              },
          (response) => {
                emit(ActivateSuccessStates(
                    activateAccountResponseEntity: response)),
              });
    }
  }
}
