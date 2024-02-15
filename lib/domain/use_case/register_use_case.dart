import 'package:dartz/dartz.dart';
import 'package:missing_finder1/data/api/base_error.dart';
import 'package:missing_finder1/domain/Entity/RegisterResponseEntity.dart';
import 'package:missing_finder1/domain/repository/repository/auth_repository.dart';

import '../Entity/ActivateAccountEntity.dart';

class RegisterUseCase {
  AuthRepository authRepository;

  RegisterUseCase({required this.authRepository});

  Future<Either<BaseError, RegisterResponseEntity>> invoke({required Map<String, dynamic> registerParameters}) {
    return authRepository.register(registerParameters: registerParameters);
  }
}

class ActivateAccountUseCase {
  AuthRepository authRepository;

  ActivateAccountUseCase({required this.authRepository});

  Future<Either<BaseError, ActivateAccountResponseEntity>> invoke(
    String activationCode,
  ) {
    return authRepository.activateAccount(activationCode);
  }
}
