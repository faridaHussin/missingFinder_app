import 'package:missing_finder1/domain/Entity/RegisterResponseEntity.dart';

class AuthResultEntity {
  RegisterResponseEntity? registerResponseEntity;
  UserEntity? userEntity;
  PersonalIdCard? personalIdCard;

  AuthResultEntity({
    this.registerResponseEntity,
    this.userEntity,
    this.personalIdCard,
  });
}
