/// secure_url : "https://res.cloudinary.com/dvferafsw/image/upload/v1701716804/du1vsz4dxlvqyy7a3i9y.png"
/// public_id : "du1vsz4dxlvqyy7a3i9y"

class PersonalIdCard {
  PersonalIdCard({
    this.secureUrl,
    this.publicId,
  });

  PersonalIdCard.fromJson(dynamic json) {
    secureUrl = json['secure_url'];
    publicId = json['public_id'];
  }

  String? secureUrl;
  String? publicId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['secure_url'] = secureUrl;
    map['public_id'] = publicId;
    return map;
  }
}
