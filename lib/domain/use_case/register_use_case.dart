import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:missing_finder1/data/api/base_error.dart';
import 'package:missing_finder1/data/model/response/RegisterResponse.dart';
import 'package:missing_finder1/domain/repository/repository/auth_repository.dart';

class RegisterUseCase {
  AuthRepository authRepository;

  RegisterUseCase({required this.authRepository});

  Future<Either<BaseError, RegisterResponse>> invoke(
      String firstName,
      String lastName,
      File personalIdCard,
      String email,
      String password,
      String confirmPassword,
      DateTime dateOfBirth,
      String gender) {
    return authRepository.register(firstName, lastName, personalIdCard, email,
        password, confirmPassword, dateOfBirth, gender);
  }
}
