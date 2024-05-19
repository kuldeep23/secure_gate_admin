// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  final String uid;
  final String socCode;
  final String socName;
  final String userRole;
  final String userFirstName;
  final String userLastName;
  final String userImage;
  final String userNumber;
  final String email;
  final String password;
  final String address;
  final String gender;
  final String dob;
  final String creationDate;
  final String deactivationDate;
  final String addedBy;
  final String isActive;
  User({
    required this.uid,
    required this.socCode,
    required this.socName,
    required this.userRole,
    required this.userFirstName,
    required this.userLastName,
    required this.userImage,
    required this.userNumber,
    required this.email,
    required this.password,
    required this.address,
    required this.gender,
    required this.dob,
    required this.creationDate,
    required this.deactivationDate,
    required this.addedBy,
    required this.isActive,
  });

  User copyWith({
    String? uid,
    String? socCode,
    String? socName,
    String? userRole,
    String? userFirstName,
    String? userLastName,
    String? userImage,
    String? userNumber,
    String? email,
    String? password,
    String? address,
    String? gender,
    String? dob,
    String? creationDate,
    String? deactivationDate,
    String? addedBy,
    String? isActive,
  }) {
    return User(
      uid: uid ?? this.uid,
      socCode: socCode ?? this.socCode,
      socName: socName ?? this.socName,
      userRole: userRole ?? this.userRole,
      userFirstName: userFirstName ?? this.userFirstName,
      userLastName: userLastName ?? this.userLastName,
      userImage: userImage ?? this.userImage,
      userNumber: userNumber ?? this.userNumber,
      email: email ?? this.email,
      password: password ?? this.password,
      address: address ?? this.address,
      gender: gender ?? this.gender,
      dob: dob ?? this.dob,
      creationDate: creationDate ?? this.creationDate,
      deactivationDate: deactivationDate ?? this.deactivationDate,
      addedBy: addedBy ?? this.addedBy,
      isActive: isActive ?? this.isActive,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'socCode': socCode,
      'socName': socName,
      'userRole': userRole,
      'userFirstName': userFirstName,
      'userLastName': userLastName,
      'userImage': userImage,
      'userNumber': userNumber,
      'email': email,
      'password': password,
      'address': address,
      'gender': gender,
      'dob': dob,
      'creationDate': creationDate,
      'deactivationDate': deactivationDate,
      'addedBy': addedBy,
      'isActive': isActive,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      uid: map['uid'] as String,
      socCode: map['soc_code'] as String,
      socName: map['soc_name'] as String,
      userRole: map['user_role'] as String,
      userFirstName: map['user_first_name'] as String,
      userLastName: map['user_last_name'] as String,
      userImage: map['user_image'] as String,
      userNumber: map['user_number'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      address: map['address'] as String,
      gender: map['gender'] as String,
      dob: map['dob'] as String,
      creationDate: map['creation_date'] as String,
      deactivationDate: map['deactivation_date'] as String,
      addedBy: map['added_by'] as String,
      isActive: map['is_active'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(uid: $uid, socCode: $socCode, socName: $socName, userRole: $userRole, userFirstName: $userFirstName, userLastName: $userLastName, userImage: $userImage, userNumber: $userNumber, email: $email, password: $password, address: $address, gender: $gender, dob: $dob, creationDate: $creationDate, deactivationDate: $deactivationDate, addedBy: $addedBy, isActive: $isActive)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;
  
    return 
      other.uid == uid &&
      other.socCode == socCode &&
      other.socName == socName &&
      other.userRole == userRole &&
      other.userFirstName == userFirstName &&
      other.userLastName == userLastName &&
      other.userImage == userImage &&
      other.userNumber == userNumber &&
      other.email == email &&
      other.password == password &&
      other.address == address &&
      other.gender == gender &&
      other.dob == dob &&
      other.creationDate == creationDate &&
      other.deactivationDate == deactivationDate &&
      other.addedBy == addedBy &&
      other.isActive == isActive;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
      socCode.hashCode ^
      socName.hashCode ^
      userRole.hashCode ^
      userFirstName.hashCode ^
      userLastName.hashCode ^
      userImage.hashCode ^
      userNumber.hashCode ^
      email.hashCode ^
      password.hashCode ^
      address.hashCode ^
      gender.hashCode ^
      dob.hashCode ^
      creationDate.hashCode ^
      deactivationDate.hashCode ^
      addedBy.hashCode ^
      isActive.hashCode;
  }
}
