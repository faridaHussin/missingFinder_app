import '../../../../domain/Entity/ActivateAccountEntity.dart';

abstract class ActivateStates {}

class ActivateInitialStates extends ActivateStates {}

class ActivateLoadingStates extends ActivateStates {
  String? LoadingMessage;

  ActivateLoadingStates({this.LoadingMessage});
}

class ActivateErrorStates extends ActivateStates {
  String? ErrorMessage;

  ActivateErrorStates({this.ErrorMessage});
}

class ActivateSuccessStates extends ActivateStates {
  ActivateAccountResponseEntity activateAccountResponseEntity;

  ActivateSuccessStates({required this.activateAccountResponseEntity});
}
