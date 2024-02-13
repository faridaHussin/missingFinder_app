import '../../../domain/Entity/ActivateAccountEntity.dart';

class ActivateAccountResponseDto {
  ActivateAccountResponseDto({
    this.success,
    this.message,
    this.error,
    this.stack,
    this.tokenActivateAccount,
  });

  ActivateAccountResponseDto.fromJson(dynamic json) {
    success = json['Success'];
    message = json['Message'];
    error = json['error'];
    stack = json['stack'];
    tokenActivateAccount = json['token_Activate_Account'];
  }

  bool? success;
  String? message;
  dynamic error;
  String? stack;
  String? tokenActivateAccount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Success'] = success;
    map['Message'] = message;
    map['error'] = error;
    map['stack'] = stack;
    map['token_Activate_Account'] = tokenActivateAccount;
    return map;
  }

  ActivateAccountResponseEntity toActivateAccountResponseEntity() {
    return ActivateAccountResponseEntity();
  }
}
