// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Staff {
  final String uid;
  final String socCode;
  final String staffName;
  final String staffType;
  final String staffIcon;
  final String staffStatus;
  final String lastEnterDate;
  final String lastEnterTime;
  final String lastExistDate;
  final String lastExistTime;
  final String staffMobileNo;
  final String staffRating;
  final String staffCreationDate;
  final String staffDeactivateDate;
  final String staffIsActive;
  Staff({
    required this.uid,
    required this.socCode,
    required this.staffName,
    required this.staffType,
    required this.staffIcon,
    required this.staffStatus,
    required this.lastEnterDate,
    required this.lastEnterTime,
    required this.lastExistDate,
    required this.lastExistTime,
    required this.staffMobileNo,
    required this.staffRating,
    required this.staffCreationDate,
    required this.staffDeactivateDate,
    required this.staffIsActive,
  });

  Staff copyWith({
    String? uid,
    String? socCode,
    String? staffName,
    String? staffType,
    String? staffIcon,
    String? staffStatus,
    String? lastEnterDate,
    String? lastEnterTime,
    String? lastExistDate,
    String? lastExistTime,
    String? staffMobileNo,
    String? staffRating,
    String? staffCreationDate,
    String? staffDeactivateDate,
    String? staffIsActive,
  }) {
    return Staff(
      uid: uid ?? this.uid,
      socCode: socCode ?? this.socCode,
      staffName: staffName ?? this.staffName,
      staffType: staffType ?? this.staffType,
      staffIcon: staffIcon ?? this.staffIcon,
      staffStatus: staffStatus ?? this.staffStatus,
      lastEnterDate: lastEnterDate ?? this.lastEnterDate,
      lastEnterTime: lastEnterTime ?? this.lastEnterTime,
      lastExistDate: lastExistDate ?? this.lastExistDate,
      lastExistTime: lastExistTime ?? this.lastExistTime,
      staffMobileNo: staffMobileNo ?? this.staffMobileNo,
      staffRating: staffRating ?? this.staffRating,
      staffCreationDate: staffCreationDate ?? this.staffCreationDate,
      staffDeactivateDate: staffDeactivateDate ?? this.staffDeactivateDate,
      staffIsActive: staffIsActive ?? this.staffIsActive,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'socCode': socCode,
      'staffName': staffName,
      'staffType': staffType,
      'staffIcon': staffIcon,
      'staffStatus': staffStatus,
      'lastEnterDate': lastEnterDate,
      'lastEnterTime': lastEnterTime,
      'lastExistDate': lastExistDate,
      'lastExistTime': lastExistTime,
      'staffMobileNo': staffMobileNo,
      'staffRating': staffRating,
      'staffCreationDate': staffCreationDate,
      'staffDeactivateDate': staffDeactivateDate,
      'staffIsActive': staffIsActive,
    };
  }

  factory Staff.fromMap(Map<String, dynamic> map) {
    return Staff(
      uid: map['uid'] as String,
      socCode: map['soc_code'] as String,
      staffName: map['staff_name'] as String,
      staffType: map['staff_type'] as String,
      staffIcon: map['staff_icon'] as String,
      staffStatus: map['staff_status'] as String,
      lastEnterDate: map['last_enter_date'] as String,
      lastEnterTime: map['last_enter_time'] as String,
      lastExistDate: map['last_exist_date'] as String,
      lastExistTime: map['last_exist_time'] as String,
      staffMobileNo: map['staff_mobile_no'] as String,
      staffRating: map['staff_rating'] as String,
      staffCreationDate: map['staff_creation_date'] as String,
      staffDeactivateDate: map['staff_deactivate_date'] as String,
      staffIsActive: map['staff_is_active'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Staff.fromJson(String source) =>
      Staff.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Staff(uid: $uid, socCode: $socCode, staffName: $staffName, staffType: $staffType, staffIcon: $staffIcon, staffStatus: $staffStatus, lastEnterDate: $lastEnterDate, lastEnterTime: $lastEnterTime, lastExistDate: $lastExistDate, lastExistTime: $lastExistTime, staffMobileNo: $staffMobileNo, staffRating: $staffRating, staffCreationDate: $staffCreationDate, staffDeactivateDate: $staffDeactivateDate, staffIsActive: $staffIsActive)';
  }

  @override
  bool operator ==(covariant Staff other) {
    if (identical(this, other)) return true;

    return other.uid == uid &&
        other.socCode == socCode &&
        other.staffName == staffName &&
        other.staffType == staffType &&
        other.staffIcon == staffIcon &&
        other.staffStatus == staffStatus &&
        other.lastEnterDate == lastEnterDate &&
        other.lastEnterTime == lastEnterTime &&
        other.lastExistDate == lastExistDate &&
        other.lastExistTime == lastExistTime &&
        other.staffMobileNo == staffMobileNo &&
        other.staffRating == staffRating &&
        other.staffCreationDate == staffCreationDate &&
        other.staffDeactivateDate == staffDeactivateDate &&
        other.staffIsActive == staffIsActive;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        socCode.hashCode ^
        staffName.hashCode ^
        staffType.hashCode ^
        staffIcon.hashCode ^
        staffStatus.hashCode ^
        lastEnterDate.hashCode ^
        lastEnterTime.hashCode ^
        lastExistDate.hashCode ^
        lastExistTime.hashCode ^
        staffMobileNo.hashCode ^
        staffRating.hashCode ^
        staffCreationDate.hashCode ^
        staffDeactivateDate.hashCode ^
        staffIsActive.hashCode;
  }
}
