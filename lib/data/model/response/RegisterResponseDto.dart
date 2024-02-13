import 'package:missing_finder1/domain/Entity/RegisterResponseEntity.dart';

class RegisterResponseDto extends RegisterResponseEntity {
  RegisterResponseDto({
    super.success,
    super.message,
    super.result,
    super.tokenActivateAccount,
  });

  RegisterResponseDto.fromJson(dynamic json) {
    success = json['success'];
    message = json['Message'];
    result = json['result'] != null ? UserDto.fromJson(json['result']) : null;
    tokenActivateAccount = json['token_Activate_Account'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['Message'] = message;
    if (result != null) {
      map['result'] = result != null ? UserDto().toJson() : null;
    }
    map['token_Activate_Account'] = tokenActivateAccount;
    return map;
  }
}

class UserDto extends UserEntity {
  UserDto({
    super.firstName,
    super.lastName,
    super.userName,
    super.email,
    super.password,
    super.dateOfBirth,
    super.gender,
    super.isConfirmed,
    super.status,
    super.role,
    super.activationCode,
    super.createdCodeActivateAccount,
    super.id,
    super.createdAt,
    super.updatedAt,
    super.v,
  });

  UserDto.fromJson(dynamic json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    userName = json['userName'];
    email = json['email'];
    password = json['password'];
    dateOfBirth = json['dateOfBirth'];
    gender = json['gender'];
    isConfirmed = json['isConfirmed'];
    status = json['status'];
    role = json['role'];
    activationCode = json['activationCode'];
    createdCodeActivateAccount = json['createdCodeActivateAccount'];
    id = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['userName'] = userName;
    map['email'] = email;
    map['password'] = password;
    map['dateOfBirth'] = dateOfBirth;
    map['gender'] = gender;
    map['isConfirmed'] = isConfirmed;
    map['status'] = status;
    map['role'] = role;
    map['activationCode'] = activationCode;
    map['createdCodeActivateAccount'] = createdCodeActivateAccount;
    map['_id'] = id;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }
}