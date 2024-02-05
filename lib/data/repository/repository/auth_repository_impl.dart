
import 'package:dartz/dartz.dart';
import 'package:missing_finder1/data/api/base_error.dart';
import 'package:missing_finder1/domain/Entity/auth_result_entity.dart';
import 'package:missing_finder1/domain/repository/data_sources/auth_remote_data_source.dart';

import '../../../domain/repository/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<BaseError, AuthResultEntity>> register(
      String firstName,
      String lastName,
      String email,
      String password,
      String confirmPassword,
      DateTime dateOfBirth,
      String gender) {
    return remoteDataSource.register(firstName, lastName, email, password,
        confirmPassword, dateOfBirth, gender);
  }
}
