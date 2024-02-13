import 'package:dartz/dartz.dart';
import 'package:missing_finder1/data/api/base_error.dart';
import 'package:missing_finder1/domain/Entity/RegisterResponseEntity.dart';

import '../../Entity/ActivateAccountEntity.dart';

abstract class AuthRemoteDataSource {
  Future<Either<BaseError, RegisterResponseEntity>> register(
      String firstName,
      String lastName,
      String email,
      String password,
      String confirmPassword,
      String dateOfBirth,
      String gender);

  Future<Either<BaseError, ActivateAccountResponseEntity>> activateAccount(
      String activationCode);
}
