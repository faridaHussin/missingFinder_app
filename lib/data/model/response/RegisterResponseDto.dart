import 'package:missing_finder1/domain/Entity/RegisterResponseEntity.dart';
import 'package:missing_finder1/domain/Entity/auth_result_entity.dart';

import 'UserDto.dart';

/// success : true
/// Message : "check inbox !"
/// result : {"firstName":"farida","lastName":"sadek","userName":"farida-sadek3l","email":"farida.sadeq7@gmail.com","password":"$2a$08$Ey0aAZMDk46FN47cpgjp/.3sB/3EOcxDqWgD3imhJVutdiuSzoFqO","personalIdCard":{"secure_url":"https://res.cloudinary.com/dvferafsw/image/upload/v1701716804/du1vsz4dxlvqyy7a3i9y.png","public_id":"du1vsz4dxlvqyy7a3i9y"},"dateOfBirth":"2002-09-30T00:00:00.000Z","gender":"Female","isConfirmed":false,"status":"offline","role":"user","activationCode":"6677","createdCodeActivateAccount":"2023-12-04T19:06:45.420Z","_id":"656e234547508b52f7bcc838","createdAt":"2023-12-04T19:06:45.442Z","updatedAt":"2023-12-04T19:06:45.442Z","__v":0}
/// token_Activate_Account : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1NmUyMzQ1NDc1MDhiNTJmN2JjYzgzOCIsImlhdCI6MTcwMTcxNjgwNSwiZXhwIjoxNzAxNzI0MDA1fQ.5mbJsYd2N8OIrtJ4E4OQDyoyL_EImJEnOiMpH9Uty4Y"

class RegisterResponseDto {
  RegisterResponseDto({
    this.success,
    this.message,
    this.result,
    this.tokenActivateAccount,
    this.error,
    this.stack,
  });

  RegisterResponseDto.fromJson(dynamic json) {
    success = json['success'];
    message = json['Message'];
    result = json['result'] != null ? UserDto.fromJson(json['result']) : null;
    tokenActivateAccount = json['token_Activate_Account'];
    error = json['error'];
    stack = json['stack'];
  }

  bool? success;
  String? message;
  UserDto? result;
  String? tokenActivateAccount;
  dynamic error;
  String? stack;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['Message'] = message;
    map['error'] = error;
    map['stack'] = stack;
    if (result != null) {
      map['result'] = result?.toJson();
    }
    map['token_Activate_Account'] = tokenActivateAccount;
    return map;
  }

  AuthResultEntity toAuthResultEntity() {
    return AuthResultEntity(
      userEntity: result?.toUserEntity(),
    );
  }
}
