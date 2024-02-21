import '../../../../domain/Entity/ActivateAccountEntity.dart';
import '../../../../domain/Entity/ReconfirmResponseEntity.dart';

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
  ActivateAccountEntity activateAccountEntity;

  ActivateSuccessStates({required this.activateAccountEntity});
}

class ReconfirmSuccessStates extends ActivateStates {
  ReconfirmResponseEntity reconfirmResponseEntity;

  ReconfirmSuccessStates({required this.reconfirmResponseEntity});
}
