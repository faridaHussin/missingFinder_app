import 'package:dartz/dartz.dart';
import 'package:missing_finder1/data/api/base_error.dart';
import 'package:missing_finder1/domain/Entity/auth_result_entity.dart';
import 'package:missing_finder1/domain/repository/repository/auth_repository.dart';

class RegisterUseCase {
  AuthRepository authRepository;

  RegisterUseCase({required this.authRepository});

  Future<Either<BaseError, AuthResultEntity>> invoke(
      String firstName,
      String lastName,
      String email,
      String password,
      String confirmPassword,
      DateTime dateOfBirth,
      String gender) {
    return authRepository.register(firstName, lastName, email, password,
        confirmPassword, dateOfBirth, gender);
  }
}
