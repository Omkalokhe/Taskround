class RegisterUserResponse {
  final int? status;
  final String? message;
  final User? user;
  final ReferredBy? referredBy;
  const RegisterUserResponse(
      {this.status, this.message, this.user, this.referredBy});
  RegisterUserResponse copyWith(
      {int? status, String? message, User? user, ReferredBy? referredBy}) {
    return RegisterUserResponse(
        status: status ?? this.status,
        message: message ?? this.message,
        user: user ?? this.user,
        referredBy: referredBy ?? this.referredBy);
  }

  Map<String, Object?> toJson() {
    return {
      'status': status,
      'message': message,
      'user': user?.toJson(),
      'referredBy': referredBy?.toJson()
    };
  }

  static RegisterUserResponse fromJson(Map<String, Object?> json) {
    return RegisterUserResponse(
        status: json['status'] == null ? null : json['status'] as int,
        message: json['message'] == null ? null : json['message'] as String,
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, Object?>),
        referredBy: json['referredBy'] == null
            ? null
            : ReferredBy.fromJson(json['referredBy'] as Map<String, Object?>));
  }

  @override
  String toString() {
    return '''RegisterUserResponse(
                status:$status,
message:$message,
user:${user.toString()},
referredBy:${referredBy.toString()}
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is RegisterUserResponse &&
        other.runtimeType == runtimeType &&
        other.status == status &&
        other.message == message &&
        other.user == user &&
        other.referredBy == referredBy;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, status, message, user, referredBy);
  }
}

class ReferredBy {
  final String? name;
  const ReferredBy({this.name});
  ReferredBy copyWith({String? name}) {
    return ReferredBy(name: name ?? this.name);
  }

  Map<String, Object?> toJson() {
    return {'name': name};
  }

  static ReferredBy fromJson(Map<String, Object?> json) {
    return ReferredBy(
        name: json['name'] == null ? null : json['name'] as String);
  }

  @override
  String toString() {
    return '''ReferredBy(
                name:$name
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is ReferredBy &&
        other.runtimeType == runtimeType &&
        other.name == name;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, name);
  }
}

class User {
  final String? id;
  final String? phone;
  final int? V;
  final bool? blockStatus;
  final String? createdAt;
  final String? fcmToken;
  final bool? isRegistered;
  final bool? isVerified;
  final String? name;
  final String? otp;
  final String? profileImg;
  final int? rating;
  final String? role;
  final String? bankDetails;
  final String? email;
  final String? refferalCode;
  const User(
      {this.id,
      this.phone,
      this.V,
      this.blockStatus,
      this.createdAt,
      this.fcmToken,
      this.isRegistered,
      this.isVerified,
      this.name,
      this.otp,
      this.profileImg,
      this.rating,
      this.role,
      this.bankDetails,
      this.email,
      this.refferalCode});
  User copyWith(
      {String? id,
      String? phone,
      int? V,
      bool? blockStatus,
      String? createdAt,
      String? fcmToken,
      bool? isRegistered,
      bool? isVerified,
      String? name,
      String? otp,
      String? profileImg,
      int? rating,
      String? role,
      String? bankDetails,
      String? email,
      String? refferalCode}) {
    return User(
        id: id ?? this.id,
        phone: phone ?? this.phone,
        V: V ?? this.V,
        blockStatus: blockStatus ?? this.blockStatus,
        createdAt: createdAt ?? this.createdAt,
        fcmToken: fcmToken ?? this.fcmToken,
        isRegistered: isRegistered ?? this.isRegistered,
        isVerified: isVerified ?? this.isVerified,
        name: name ?? this.name,
        otp: otp ?? this.otp,
        profileImg: profileImg ?? this.profileImg,
        rating: rating ?? this.rating,
        role: role ?? this.role,
        bankDetails: bankDetails ?? this.bankDetails,
        email: email ?? this.email,
        refferalCode: refferalCode ?? this.refferalCode);
  }

  Map<String, Object?> toJson() {
    return {
      '_id': id,
      'phone': phone,
      '__v': V,
      'blockStatus': blockStatus,
      'createdAt': createdAt,
      'fcmToken': fcmToken,
      'isRegistered': isRegistered,
      'isVerified': isVerified,
      'name': name,
      'otp': otp,
      'profile_img': profileImg,
      'rating': rating,
      'role': role,
      'bankDetails': bankDetails,
      'email': email,
      'refferal_Code': refferalCode
    };
  }

  static User fromJson(Map<String, Object?> json) {
    return User(
        id: json['_id'] == null ? null : json['_id'] as String,
        phone: json['phone'] == null ? null : json['phone'] as String,
        V: json['__v'] == null ? null : json['__v'] as int,
        blockStatus:
            json['blockStatus'] == null ? null : json['blockStatus'] as bool,
        createdAt:
            json['createdAt'] == null ? null : json['createdAt'] as String,
        fcmToken: json['fcmToken'] == null ? null : json['fcmToken'] as String,
        isRegistered:
            json['isRegistered'] == null ? null : json['isRegistered'] as bool,
        isVerified:
            json['isVerified'] == null ? null : json['isVerified'] as bool,
        name: json['name'] == null ? null : json['name'] as String,
        otp: json['otp'] == null ? null : json['otp'] as String,
        profileImg:
            json['profile_img'] == null ? null : json['profile_img'] as String,
        rating: json['rating'] == null ? null : json['rating'] as int,
        role: json['role'] == null ? null : json['role'] as String,
        bankDetails:
            json['bankDetails'] == null ? null : json['bankDetails'] as String,
        email: json['email'] == null ? null : json['email'] as String,
        refferalCode: json['refferal_Code'] == null
            ? null
            : json['refferal_Code'] as String);
  }

  @override
  String toString() {
    return '''User(
                id:$id,
phone:$phone,
V:$V,
blockStatus:$blockStatus,
createdAt:$createdAt,
fcmToken:$fcmToken,
isRegistered:$isRegistered,
isVerified:$isVerified,
name:$name,
otp:$otp,
profileImg:$profileImg,
rating:$rating,
role:$role,
bankDetails:$bankDetails,
email:$email,
refferalCode:$refferalCode
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is User &&
        other.runtimeType == runtimeType &&
        other.id == id &&
        other.phone == phone &&
        other.V == V &&
        other.blockStatus == blockStatus &&
        other.createdAt == createdAt &&
        other.fcmToken == fcmToken &&
        other.isRegistered == isRegistered &&
        other.isVerified == isVerified &&
        other.name == name &&
        other.otp == otp &&
        other.profileImg == profileImg &&
        other.rating == rating &&
        other.role == role &&
        other.bankDetails == bankDetails &&
        other.email == email &&
        other.refferalCode == refferalCode;
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        id,
        phone,
        V,
        blockStatus,
        createdAt,
        fcmToken,
        isRegistered,
        isVerified,
        name,
        otp,
        profileImg,
        rating,
        role,
        bankDetails,
        email,
        refferalCode);
  }
}
