import 'package:missing_finder1/data/model/response/RegisterResponseDto.dart';
import 'package:missing_finder1/domain/Entity/auth_result_entity.dart';

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
  AuthResultEntity resultEntity;

  RegisterSuccessStates({required this.resultEntity});
}
