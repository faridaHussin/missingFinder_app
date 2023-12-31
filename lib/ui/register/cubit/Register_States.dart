import 'package:missing_finder1/data/model/response/RegisterResponse.dart';

abstract class RegisterStates {}

class RegisterInitialStates extends RegisterStates {}

class RegisterLoadingStates extends RegisterStates {
  String? LoadingMessage;

  RegisterLoadingStates({this.LoadingMessage});
}

class RegisterErrorStates extends RegisterStates {
  String? ErrorMessage;

  RegisterErrorStates({this.ErrorMessage});
}

class RegisterSuccessStates extends RegisterStates {
  RegisterResponse response;

  RegisterSuccessStates({required this.response});
}
