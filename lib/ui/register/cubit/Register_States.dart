import '../../../domain/Entity/RegisterResponseEntity.dart';

abstract class RegisterStates {}

class RegisterInitialStates extends RegisterStates {}

class RegisterLoadingStates extends RegisterStates {
  final String? LoadingMessage;

  RegisterLoadingStates({this.LoadingMessage});
}

class RegisterErrorStates extends RegisterStates {
  String? Message;

  RegisterErrorStates({this.Message});
}

class RegisterSuccessStates extends RegisterStates {
  RegisterResponseEntity registerResponseEntity;

  RegisterSuccessStates({required this.registerResponseEntity});
}
