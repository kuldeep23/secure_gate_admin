// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SocietyUser {
  final String uid;
  final String socCode;
  final String socName;
  final String ownerTenant;
  final String ownerFirstName;
  final String ownerLastName;
  final String ownerImage;
  final String contactNumber;
  final String email;
  final String password;
  final String oTPCode;
  final String homeTownAddress;
  final String member;
  final String gender;
  final String fBId;
  final String dob;
  final String bloodGroup;
  final String profession;
  final String professionDetails;
  final String flatNumber;
  final String flatBlock;
  final String flatFloor;
  final String flatType;
  final String parkingType;
  final String parkingNumber;
  final String petType;
  final String petName;
  final String twoWheelerType;
  final String twoWheelerNumber;
  final String fourWheelerBrand;
  final String fourWheelerNumber;
  final String creationDate;
  final String updationDate;
  final String deActivationDate;
  final String isActive;
  SocietyUser({
    required this.uid,
    required this.socCode,
    required this.socName,
    required this.ownerTenant,
    required this.ownerFirstName,
    required this.ownerLastName,
    required this.ownerImage,
    required this.contactNumber,
    required this.email,
    required this.password,
    required this.oTPCode,
    required this.homeTownAddress,
    required this.member,
    required this.gender,
    required this.fBId,
    required this.dob,
    required this.bloodGroup,
    required this.profession,
    required this.professionDetails,
    required this.flatNumber,
    required this.flatBlock,
    required this.flatFloor,
    required this.flatType,
    required this.parkingType,
    required this.parkingNumber,
    required this.petType,
    required this.petName,
    required this.twoWheelerType,
    required this.twoWheelerNumber,
    required this.fourWheelerBrand,
    required this.fourWheelerNumber,
    required this.creationDate,
    required this.updationDate,
    required this.deActivationDate,
    required this.isActive,
  });

  SocietyUser copyWith({
    String? uid,
    String? socCode,
    String? socName,
    String? ownerTenant,
    String? ownerFirstName,
    String? ownerLastName,
    String? ownerImage,
    String? contactNumber,
    String? email,
    String? password,
    String? oTPCode,
    String? homeTownAddress,
    String? member,
    String? gender,
    String? fBId,
    String? dob,
    String? bloodGroup,
    String? profession,
    String? professionDetails,
    String? flatNumber,
    String? flatBlock,
    String? flatFloor,
    String? flatType,
    String? parkingType,
    String? parkingNumber,
    String? petType,
    String? petName,
    String? twoWheelerType,
    String? twoWheelerNumber,
    String? fourWheelerBrand,
    String? fourWheelerNumber,
    String? creationDate,
    String? updationDate,
    String? deActivationDate,
    String? isActive,
  }) {
    return SocietyUser(
      uid: uid ?? this.uid,
      socCode: socCode ?? this.socCode,
      socName: socName ?? this.socName,
      ownerTenant: ownerTenant ?? this.ownerTenant,
      ownerFirstName: ownerFirstName ?? this.ownerFirstName,
      ownerLastName: ownerLastName ?? this.ownerLastName,
      ownerImage: ownerImage ?? this.ownerImage,
      contactNumber: contactNumber ?? this.contactNumber,
      email: email ?? this.email,
      password: password ?? this.password,
      oTPCode: oTPCode ?? this.oTPCode,
      homeTownAddress: homeTownAddress ?? this.homeTownAddress,
      member: member ?? this.member,
      gender: gender ?? this.gender,
      fBId: fBId ?? this.fBId,
      dob: dob ?? this.dob,
      bloodGroup: bloodGroup ?? this.bloodGroup,
      profession: profession ?? this.profession,
      professionDetails: professionDetails ?? this.professionDetails,
      flatNumber: flatNumber ?? this.flatNumber,
      flatBlock: flatBlock ?? this.flatBlock,
      flatFloor: flatFloor ?? this.flatFloor,
      flatType: flatType ?? this.flatType,
      parkingType: parkingType ?? this.parkingType,
      parkingNumber: parkingNumber ?? this.parkingNumber,
      petType: petType ?? this.petType,
      petName: petName ?? this.petName,
      twoWheelerType: twoWheelerType ?? this.twoWheelerType,
      twoWheelerNumber: twoWheelerNumber ?? this.twoWheelerNumber,
      fourWheelerBrand: fourWheelerBrand ?? this.fourWheelerBrand,
      fourWheelerNumber: fourWheelerNumber ?? this.fourWheelerNumber,
      creationDate: creationDate ?? this.creationDate,
      updationDate: updationDate ?? this.updationDate,
      deActivationDate: deActivationDate?? this.deActivationDate,
      isActive: isActive ?? this.isActive,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'socCode': socCode,
      'socName': socName,
      'ownerTenant': ownerTenant,
      'ownerFirstName': ownerFirstName,
      'ownerLastName': ownerLastName,
      'ownerImage': ownerImage,
      'contactNumber': contactNumber,
      'email': email,
      'password': password,
      'oTPCode': oTPCode,
      'homeTownAddress': homeTownAddress,
      'member': member,
      'gender': gender,
      'fBId': fBId,
      'dob': dob,
      'bloodGroup': bloodGroup,
      'profession': profession,
      'professionDetails': professionDetails,
      'flatNumber': flatNumber,
      'flatBlock': flatBlock,
      'flatFloor': flatFloor,
      'flatType': flatType,
      'parkingType': parkingType,
      'parkingNumber': parkingNumber,
      'petType': petType,
      'petName': petName,
      'twoWheelerType': twoWheelerType,
      'twoWheelerNumber': twoWheelerNumber,
      'fourWheelerBrand': fourWheelerBrand,
      'fourWheelerNumber': fourWheelerNumber,
      'creationDate': creationDate,
      'updationDate': updationDate,
      'deActivationDate' :deActivationDate,
      'isActive': isActive,
    };
  }

  factory SocietyUser.fromMap(Map<String, dynamic> map) {
    return SocietyUser(
      uid: map['UID'] as String,
      socCode: map['Soc_Code'] as String,
      socName: map['Soc_Name'] as String,
      ownerTenant: map['Owner_Tenant'] as String,
      ownerFirstName: map['Owner_First_Name'] as String,
      ownerLastName: map['Owner_Last_Name'] as String,
      ownerImage: map['Owner_Image'] as String,
      contactNumber: map['Contact_Number'] as String,
      email: map['Email'] as String,
      password: map['Password'] as String,
      oTPCode: map['OTP_Code'] as String,
      homeTownAddress: map['HomeTown_Address'] as String,
      member: map['Member'] as String,
      gender: map['Gender'] as String,
      fBId: map['FB_Id'] as String,
      dob: map['DOB'] as String,
      bloodGroup: map['Blood_Group'] as String,
      profession: map['Profession'] as String,
      professionDetails: map['Profession_Details'] as String,
      flatNumber: map['Flat_Number'] as String,
      flatBlock: map['Flat_Block'] as String,
      flatFloor: map['Flat_Floor'] as String,
      flatType: map['Flat_Type'] as String,
      parkingType: map['Parking_Type'] as String,
      parkingNumber: map['Parking_Number'] as String,
      petType: map['Pet_Type'] as String,
      petName: map['Pet_Name'] as String,
      twoWheelerType: map['Two_Wheeler_Type'] as String,
      twoWheelerNumber: map['Two_Wheeler_Number'] as String,
      fourWheelerBrand: map['Four_Wheeler_Brand'] as String,
      fourWheelerNumber: map['Four_Wheeler_Number'] as String,
      creationDate: map['Creation_Date'] as String,
      updationDate: map['Updation_Date'] as String,
      deActivationDate: map['De_Activation_Date'] as String,
      isActive: map['Is_Active'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SocietyUser.fromJson(String source) =>
      SocietyUser.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Staff(uid: $uid, socCode: $socCode, socName: $socName, ownerTenant: $ownerTenant, ownerFirstName: $ownerFirstName, ownerLastName "$ownerLastName, ownerImage: $ownerImage, contactNumber: $contactNumber, email: $email, password: $password, oTPCode: $oTPCode, homeTownAddress: $homeTownAddress, member: $member, gender: $gender, fBId: $fBId, dob: $dob, bloodGroup: $bloodGroup, profession: $profession, professionDetails: $professionDetails, flatNumber: $flatNumber, flatBlock: $flatBlock, flatFloor: $flatFloor, flatType: $flatType, parkingType: $parkingType, parkingNumber: $parkingNumber, petType: $petType, petName: $petName, twoWheelerType: $twoWheelerType, twoWheelerNumber: $twoWheelerNumber, fourWheelerBrand: $fourWheelerBrand, fourWheelerNumber: $fourWheelerNumber, creationDate: $creationDate, updationDate: $updationDate, deActivationDate: $deActivationDate, isActive: $isActive)';
  }

  @override
  bool operator ==(covariant SocietyUser other) {
    if (identical(this, other)) return true;

    return other.uid == uid &&
        other.socCode == socCode &&
        other.socName == socName &&
        other.ownerTenant == ownerTenant &&
        other.ownerFirstName == ownerFirstName &&
        other.ownerLastName == ownerLastName &&
        other.ownerImage == ownerImage &&
        other.contactNumber == contactNumber &&
        other.email == email &&
        other.password == password &&
        other.oTPCode == oTPCode &&
        other.homeTownAddress == homeTownAddress &&
        other.member == member &&
        other.gender == gender &&
        other.fBId == fBId &&
        other.dob == dob &&
        other.bloodGroup == bloodGroup &&
        other.profession == profession &&
        other.professionDetails == professionDetails &&
        other.flatNumber == flatNumber &&
        other.flatBlock == flatBlock &&
        other.flatFloor == flatFloor &&
        other.flatType == flatType &&
        other.parkingType == parkingType &&
        other.parkingNumber == parkingNumber &&
        other.petType == petType &&
        other.petName == petName &&
        other.twoWheelerType == twoWheelerType &&
        other.twoWheelerNumber == twoWheelerNumber &&
        other.fourWheelerBrand == fourWheelerBrand &&
        other.fourWheelerNumber == fourWheelerNumber &&
        other.creationDate == creationDate &&
        other.updationDate == updationDate &&
        other.deActivationDate == deActivationDate &&
        other.isActive == isActive;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        socCode.hashCode ^
        socName.hashCode ^
        ownerTenant.hashCode ^
        ownerFirstName.hashCode ^
        ownerLastName.hashCode ^
        ownerImage.hashCode ^
        contactNumber.hashCode ^
        email.hashCode ^
        password.hashCode ^
        oTPCode.hashCode ^
        homeTownAddress.hashCode ^
        member.hashCode ^
        gender.hashCode ^
        fBId.hashCode ^
        dob.hashCode ^
        bloodGroup.hashCode ^
        profession.hashCode ^
        professionDetails.hashCode ^
        flatNumber.hashCode ^
        flatBlock.hashCode ^
        flatFloor.hashCode ^
        flatType.hashCode ^
        parkingType.hashCode ^
        parkingNumber.hashCode ^
        petType.hashCode ^
        petName.hashCode ^
        twoWheelerType.hashCode ^
        twoWheelerNumber.hashCode ^
        fourWheelerBrand.hashCode ^
        fourWheelerNumber.hashCode ^
        creationDate.hashCode ^
        updationDate.hashCode ^
        deActivationDate.hashCode ^
        isActive.hashCode;
  }
}
