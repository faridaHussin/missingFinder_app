import 'PersonalIdCard.dart';

/// firstName : "farida"
/// lastName : "sadek"
/// userName : "farida-sadek3l"
/// email : "farida.sadeq7@gmail.com"
/// password : "$2a$08$Ey0aAZMDk46FN47cpgjp/.3sB/3EOcxDqWgD3imhJVutdiuSzoFqO"
/// personalIdCard : {"secure_url":"https://res.cloudinary.com/dvferafsw/image/upload/v1701716804/du1vsz4dxlvqyy7a3i9y.png","public_id":"du1vsz4dxlvqyy7a3i9y"}
/// dateOfBirth : "2002-09-30T00:00:00.000Z"
/// gender : "Female"
/// isConfirmed : false
/// status : "offline"
/// role : "user"
/// activationCode : "6677"
/// createdCodeActivateAccount : "2023-12-04T19:06:45.420Z"
/// _id : "656e234547508b52f7bcc838"
/// createdAt : "2023-12-04T19:06:45.442Z"
/// updatedAt : "2023-12-04T19:06:45.442Z"
/// __v : 0

class Result {
  Result({
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

  Result.fromJson(dynamic json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    userName = json['userName'];
    email = json['email'];
    password = json['password'];
    personalIdCard = json['personalIdCard'] != null
        ? PersonalIdCard.fromJson(json['personalIdCard'])
        : null;
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

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['userName'] = userName;
    map['email'] = email;
    map['password'] = password;
    if (personalIdCard != null) {
      map['personalIdCard'] = personalIdCard?.toJson();
    }
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
