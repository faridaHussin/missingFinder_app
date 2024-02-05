class RegisterResponseEntity {
  RegisterResponseEntity({
    this.success,
    this.message,
    this.result,
    this.tokenActivateAccount,
  });

  bool? success;
  String? message;
  UserEntity? result;
  String? tokenActivateAccount;
}

class UserEntity {
  UserEntity({
    this.firstName,
    this.lastName,
    this.userName,
    this.email,
    this.password,
    this.personalIdCard,
    this.dateOfBirth,
    this.gender,
    this.isConfirmed,
    this.status,
    this.role,
    this.activationCode,
    this.createdCodeActivateAccount,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String? firstName;
  String? lastName;
  String? userName;
  String? email;
  String? password;
  PersonalIdCard? personalIdCard;
  String? dateOfBirth;
  String? gender;
  bool? isConfirmed;
  String? status;
  String? role;
  String? activationCode;
  String? createdCodeActivateAccount;
  String? id;
  String? createdAt;
  String? updatedAt;
  int? v;
}

class PersonalIdCard {
  PersonalIdCard({
    this.secureUrl,
    this.publicId,
  });

  String? secureUrl;
  String? publicId;
}
