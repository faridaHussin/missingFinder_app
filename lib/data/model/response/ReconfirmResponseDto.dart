import 'package:missing_finder1/domain/Entity/ReconfirmResponseEntity.dart';

class ReconfirmResponseDto extends ReconfirmResponseEntity {
  ReconfirmResponseDto({
    super.success,
    super.message,
  });

  ReconfirmResponseDto.fromJson(dynamic json) {
    success = json['success'];
    message = json['Message'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['Message'] = message;
    return map;
  }
}
