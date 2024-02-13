import 'package:dartz/dartz.dart';
import 'package:missing_finder1/data/api/api_manager.dart';
import 'package:missing_finder1/data/api/base_error.dart';
import 'package:missing_finder1/domain/Entity/ActivateAccountEntity.dart';
import 'package:missing_finder1/domain/Entity/RegisterResponseEntity.dart';

import '../../../domain/repository/data_sources/auth_remote_data_source.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  ApiManager apiManager;

  AuthRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<BaseError, RegisterResponseEntity>> register(
      String firstName,
      String lastName,
      String email,
      String password,
      String confirmPassword,
      String dateOfBirth,
      String gender) async {
    var either = await apiManager.register(firstName, lastName, email, password,
        confirmPassword, dateOfBirth, gender);
    return either.fold((error) {
      return Left(BaseError(errorMessage: error.errorMessage));
    }, (response) {
      return Right(response);
    });
  }

  @override
  Future<Either<BaseError, ActivateAccountResponseEntity>> activateAccount(
      String activationCode) async {
    var either = await apiManager.activateAccount(activationCode);
    return either.fold((error) {
      return Left(BaseError(errorMessage: error.errorMessage));
    }, (response) {
      return Right(response.toActivateAccountResponseEntity());
    });
  }
}
