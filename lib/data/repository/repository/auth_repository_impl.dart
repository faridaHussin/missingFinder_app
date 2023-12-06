import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:missing_finder1/data/api/base_error.dart';
import 'package:missing_finder1/data/model/response/RegisterResponse.dart';
import 'package:missing_finder1/domain/repository/data_sources/auth_remote_data_source.dart';

import '../../../domain/repository/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<BaseError, RegisterResponse>> register(
      String firstName,
      String lastName,
      File personalIdCard,
      String email,
      String password,
      String confirmPassword,
      DateTime dateOfBirth,
      String gender) {
    return remoteDataSource.register(firstName, lastName, personalIdCard, email,
        password, confirmPassword, dateOfBirth, gender);
  }
}
