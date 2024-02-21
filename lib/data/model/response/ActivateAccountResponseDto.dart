import 'package:missing_finder1/domain/Entity/ActivateAccountEntity.dart';

class ActivateAccountResponseDto extends ActivateAccountEntity {
  ActivateAccountResponseDto({
    super.message,
  });

  ActivateAccountResponseDto.fromJson(dynamic json) {
    message = json['Message'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Message'] = message;
    return map;
  }

}