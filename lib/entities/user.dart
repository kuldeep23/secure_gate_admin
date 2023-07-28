// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  final String uid;
  final String socCode;
  final String socName;
  final String socRole;
  final String ownerFirstName;
  final String ownerLastName;
  final String ownerImage;
  final String contactNumber;
  final String email;
  final String password;
  final String otpCode;
  final String address;
  final String gender;
  final String dob;
  final String socFlatNumber;
  final String creationDate;
  final String isActive;
  User({
    required this.uid,
    required this.socCode,
    required this.socName,
    required this.socRole,
    required this.ownerFirstName,
    required this.ownerLastName,
    required this.ownerImage,
    required this.contactNumber,
    required this.email,
    required this.password,
    required this.otpCode,
    required this.address,
    required this.gender,
    required this.dob,
    required this.socFlatNumber,
    required this.creationDate,
    required this.isActive,
  });

  User copyWith({
    String? uid,
    String? socCode,
    String? socName,
    String? socRole,
    String? ownerFirstName,
    String? ownerLastName,
    String? ownerImage,
    String? contactNumber,
    String? email,
    String? password,
    String? otpCode,
    String? address,
    String? gender,
    String? dob,
    String? socFlatNumber,
    String? creationDate,
    String? isActive,
  }) {
    return User(
      uid: uid ?? this.uid,
      socCode: socCode ?? this.socCode,
      socName: socName ?? this.socName,
      socRole: socRole ?? this.socRole,
      ownerFirstName: ownerFirstName ?? this.ownerFirstName,
      ownerLastName: ownerLastName ?? this.ownerLastName,
      ownerImage: ownerImage ?? this.ownerImage,
      contactNumber: contactNumber ?? this.contactNumber,
      email: email ?? this.email,
      password: password ?? this.password,
      otpCode: otpCode ?? this.otpCode,
      address: address ?? this.address,
      gender: gender ?? this.gender,
      dob: dob ?? this.dob,
      socFlatNumber: socFlatNumber ?? this.socFlatNumber,
      creationDate: creationDate ?? this.creationDate,
      isActive: isActive ?? this.isActive,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'socCode': socCode,
      'socName': socName,
      'socRole': socRole,
      'ownerFirstName': ownerFirstName,
      'ownerLastName': ownerLastName,
      'ownerImage': ownerImage,
      'contactNumber': contactNumber,
      'email': email,
      'password': password,
      'otpCode': otpCode,
      'address': address,
      'gender': gender,
      'dob': dob,
      'socFlatNumber': socFlatNumber,
      'creationDate': creationDate,
      'isActive': isActive,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      uid: map['UID'] as String,
      socCode: map['Soc_Code'] as String,
      socName: map['Soc_Name'] as String,
      socRole: map['Soc_Role'] as String,
      ownerFirstName: map['Owner_First_Name'] as String,
      ownerLastName: map['Owner_Last_Name'] as String,
      ownerImage: map['Owner_Image'] as String,
      contactNumber: map['Contact_Number'] as String,
      email: map['Email'] as String,
      password: map['Password'] as String,
      otpCode: map['OTP_Code'] as String,
      address: map['Address'] as String,
      gender: map['Gender'] as String,
      dob: map['DOB'] as String,
      socFlatNumber: map['Soc_Flat_Number'] as String,
      creationDate: map['Creation_Date'] as String,
      isActive: map['Is_Active'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(uid: $uid, socCode: $socCode, socName: $socName, socRole: $socRole, ownerFirstName: $ownerFirstName, ownerLastName: $ownerLastName, ownerImage: $ownerImage, contactNumber: $contactNumber, email: $email, password: $password, otpCode: $otpCode, address: $address, gender: $gender, dob: $dob, socFlatNumber: $socFlatNumber, creationDate: $creationDate, isActive: $isActive)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.uid == uid &&
        other.socCode == socCode &&
        other.socName == socName &&
        other.socRole == socRole &&
        other.ownerFirstName == ownerFirstName &&
        other.ownerLastName == ownerLastName &&
        other.ownerImage == ownerImage &&
        other.contactNumber == contactNumber &&
        other.email == email &&
        other.password == password &&
        other.otpCode == otpCode &&
        other.address == address &&
        other.gender == gender &&
        other.dob == dob &&
        other.socFlatNumber == socFlatNumber &&
        other.creationDate == creationDate &&
        other.isActive == isActive;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        socCode.hashCode ^
        socName.hashCode ^
        socRole.hashCode ^
        ownerFirstName.hashCode ^
        ownerLastName.hashCode ^
        ownerImage.hashCode ^
        contactNumber.hashCode ^
        email.hashCode ^
        password.hashCode ^
        otpCode.hashCode ^
        address.hashCode ^
        gender.hashCode ^
        dob.hashCode ^
        socFlatNumber.hashCode ^
        creationDate.hashCode ^
        isActive.hashCode;
  }
}
