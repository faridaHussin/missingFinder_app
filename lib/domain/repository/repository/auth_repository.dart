import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:missing_finder1/data/api/base_error.dart';
import 'package:missing_finder1/data/model/response/RegisterResponse.dart';

abstract class AuthRepository {
  Future<Either<BaseError, RegisterResponse>> register(
      String firstName,
      String lastName,
      File personalIdCard,
      String email,
      String password,
      String confirmPassword,
      DateTime dateOfBirth,
      String gender);
}
