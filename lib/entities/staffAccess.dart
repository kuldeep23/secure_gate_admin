// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class StaffAccess {
 final String id;
 final String staffuid;
 final String staffsoccode;
 final String staffenterdate;
 final String staffentertime;
 final String staffexitdate;
 final String staffexittime;
 final String staffstatus;
  StaffAccess({
    required this.id,
    required this.staffuid,
    required this.staffsoccode,
    required this.staffenterdate,
    required this.staffentertime,
    required this.staffexitdate,
    required this.staffexittime,
    required this.staffstatus,
  });

  StaffAccess copyWith({
    String? id,
    String? staffuid,
    String? staffsoccode,
    String? staffenterdate,
    String? staffentertime,
    String? staffexitdate,
    String? staffexittime,
    String? staffstatus,
  }) {
    return StaffAccess(
      id: id ?? this.id,
      staffuid: staffuid ?? this.staffuid,
      staffsoccode: staffsoccode ?? this.staffsoccode,
      staffenterdate: staffenterdate ?? this.staffenterdate,
      staffentertime: staffentertime ?? this.staffentertime,
      staffexitdate: staffexitdate ?? this.staffexitdate,
      staffexittime: staffexittime ?? this.staffexittime,
      staffstatus: staffstatus ?? this.staffstatus,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'staffuid': staffuid,
      'staffsoccode': staffsoccode,
      'staffenterdate': staffenterdate,
      'staffentertime': staffentertime,
      'staffexitdate': staffexitdate,
      'staffexittime': staffexittime,
      'staffstatus': staffstatus,
    };
  }

  factory StaffAccess.fromMap(Map<String, dynamic> map) {
    return StaffAccess(
      id: map['id'] as String,
      staffuid: map['staff_uid'] as String,
      staffsoccode: map['staff_soc_code'] as String,
      staffenterdate: map['staff_enter_date'] as String,
      staffentertime: map['staff_enter_time'] as String,
      staffexitdate: map['staff_exit_date'] as String,
      staffexittime: map['staff_exit_time'] as String,
      staffstatus: map['staff_status'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory StaffAccess.fromJson(String source) => StaffAccess.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'StaffAccess(id: $id, staffuid: $staffuid, staffsoccode: $staffsoccode, staffenterdate: $staffenterdate, staffentertime: $staffentertime, staffexitdate: $staffexitdate, staffexittime: $staffexittime, staffstatus: $staffstatus)';
  }

  @override
  bool operator ==(covariant StaffAccess other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.staffuid == staffuid &&
      other.staffsoccode == staffsoccode &&
      other.staffenterdate == staffenterdate &&
      other.staffentertime == staffentertime &&
      other.staffexitdate == staffexitdate &&
      other.staffexittime == staffexittime &&
      other.staffstatus == staffstatus;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      staffuid.hashCode ^
      staffsoccode.hashCode ^
      staffenterdate.hashCode ^
      staffentertime.hashCode ^
      staffexitdate.hashCode ^
      staffexittime.hashCode ^
      staffstatus.hashCode;
  }
}
