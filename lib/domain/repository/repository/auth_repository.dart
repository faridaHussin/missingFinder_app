import 'package:dartz/dartz.dart';
import 'package:missing_finder1/data/api/base_error.dart';
import 'package:missing_finder1/domain/Entity/RegisterResponseEntity.dart';

import '../../Entity/ActivateAccountEntity.dart';
import '../../Entity/ReconfirmResponseEntity.dart';

abstract class AuthRepository {
  Future<Either<BaseError, RegisterResponseEntity>> register(
      {required Map<String, dynamic> registerParameters});

  Future<Either<BaseError, ActivateAccountEntity>> activateAccount(
      String activationCode);

  Future<Either<BaseError, ReconfirmResponseEntity>> reconfirmAccount();
}
