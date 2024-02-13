class ActivateAccountRequest {
  ActivateAccountRequest({
    this.activationCode,
  });

  ActivateAccountRequest.fromJson(dynamic json) {
    activationCode = json['activationCode'];
  }

  String? activationCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['activationCode'] = activationCode;
    return map;
  }
}
