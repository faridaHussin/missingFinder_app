/// personalIdCard : "o5RdPzv4k/Screenshot (27).png"
/// firstName : "Abdo"
/// lastName : "zaki"
/// phone : "+201025502697"
/// password : "Aa10666$47"
/// confirmPassword : "Aa10666$47"
/// dateOfBirth : "2002-9-30"
/// gender : "Male"

class RegisterRequest {
  RegisterRequest({
    this.personalIdCard,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.confirmPassword,
    this.dateOfBirth,
    this.gender,
  });

  RegisterRequest.fromJson(dynamic json) {
    personalIdCard = json['personalIdCard'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['phone'];
    password = json['password'];
    confirmPassword = json['confirmPassword'];
    dateOfBirth = json['dateOfBirth'];
    gender = json['gender'];
  }

  String? personalIdCard;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? confirmPassword;
  String? dateOfBirth;
  String? gender;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['personalIdCard'] = personalIdCard;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['phone'] = email;
    map['password'] = password;
    map['confirmPassword'] = confirmPassword;
    map['dateOfBirth'] = dateOfBirth;
    map['gender'] = gender;
    return map;
  }
}
