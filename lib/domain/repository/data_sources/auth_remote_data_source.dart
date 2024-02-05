import 'package:dartz/dartz.dart';
import 'package:missing_finder1/data/api/base_error.dart';
import 'package:missing_finder1/domain/Entity/auth_result_entity.dart';

abstract class AuthRemoteDataSource {
  Future<Either<BaseError, AuthResultEntity>> register(
      String firstName,
      String lastName,
      String email,
      String password,
      String confirmPassword,
      DateTime dateOfBirth,
      String gender);
}
