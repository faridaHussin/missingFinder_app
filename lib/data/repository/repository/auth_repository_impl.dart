import 'package:dartz/dartz.dart';
import 'package:missing_finder1/data/api/base_error.dart';
import 'package:missing_finder1/domain/Entity/ActivateAccountEntity.dart';
import 'package:missing_finder1/domain/Entity/RegisterResponseEntity.dart';
import 'package:missing_finder1/domain/repository/data_sources/auth_remote_data_source.dart';

import '../../../domain/repository/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<BaseError, RegisterResponseEntity>> register({
    required Map<String,dynamic> registerParameters
  }) {
    return remoteDataSource.register(registerParameters: registerParameters);
  }

  @override
  Future<Either<BaseError, ActivateAccountResponseEntity>> activateAccount(
      String activationCode) {
    return remoteDataSource.activateAccount(activationCode);
  }
}
