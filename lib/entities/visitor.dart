// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Visitor {
  final String visitorId;
  final String socCode;
  final String visitorType;
  final String visitorTypeDetail;
  final String visitorName;
  final String visitorMobile;
  final String visitorFlatNo;
  final String visitorImage;
  final String visitorEnterDate;
  final String visitorEnterTime;
  final String? visitorEnterBy;
  final String? visitorExitDate;
  final String? visitorExitTime;
  final String? visitorExitBy;
  final String visitorStatus;
  final String visitorIsValidUpdate;
  final String visitorApprovReject;
  final String visitorAppRejBy;
  final String visitorRejByName;
  final String visitorIsValid;
  final String? visitorReview;
  Visitor({
    required this.visitorId,
    required this.socCode,
    required this.visitorType,
    required this.visitorTypeDetail,
    required this.visitorName,
    required this.visitorMobile,
    required this.visitorFlatNo,
    required this.visitorImage,
    required this.visitorEnterDate,
    required this.visitorEnterTime,
    this.visitorEnterBy,
    this.visitorExitDate,
    this.visitorExitTime,
    this.visitorExitBy,
    required this.visitorStatus,
    required this.visitorIsValidUpdate,
    required this.visitorApprovReject,
    required this.visitorAppRejBy,
    required this.visitorRejByName,
    required this.visitorIsValid,
    required this.visitorReview,
  });

  Visitor copyWith({
    String? visitorId,
    String? socCode,
    String? visitorType,
    String? visitorTypeDetail,
    String? visitorName,
    String? visitorMobile,
    String? visitorFlatNo,
    String? visitorImage,
    String? visitorEnterDate,
    String? visitorEnterTime,
    String? visitorEnterBy,
    String? visitorExitDate,
    String? visitorExitTime,
    String? visitorExitBy,
    String? visitorStatus,
    String? visitorIsValidUpdate,
    String? visitorApprovReject,
    String? visitorAppRejBy,
    String? visitorRejByName,
    String? visitorIsValid,
    String? visitorReview,
  }) {
    return Visitor(
      visitorId: visitorId ?? this.visitorId,
      socCode: socCode ?? this.socCode,
      visitorType: visitorType ?? this.visitorType,
      visitorTypeDetail: visitorTypeDetail ?? this.visitorTypeDetail,
      visitorName: visitorName ?? this.visitorName,
      visitorMobile: visitorMobile ?? this.visitorMobile,
      visitorFlatNo: visitorFlatNo ?? this.visitorFlatNo,
      visitorImage: visitorImage ?? this.visitorImage,
      visitorEnterDate: visitorEnterDate ?? this.visitorEnterDate,
      visitorEnterTime: visitorEnterTime ?? this.visitorEnterTime,
      visitorEnterBy: visitorEnterBy ?? this.visitorEnterBy,
      visitorExitDate: visitorExitDate ?? this.visitorExitDate,
      visitorExitTime: visitorExitTime ?? this.visitorExitTime,
      visitorExitBy: visitorExitBy ?? this.visitorExitBy,
      visitorStatus: visitorStatus ?? this.visitorStatus,
      visitorIsValidUpdate: visitorIsValidUpdate ?? this.visitorIsValidUpdate,
      visitorApprovReject: visitorApprovReject ?? this.visitorApprovReject,
      visitorAppRejBy: visitorAppRejBy ?? this.visitorAppRejBy,
      visitorRejByName: visitorRejByName ?? this.visitorRejByName,
      visitorIsValid: visitorIsValid ?? this.visitorIsValid,
      visitorReview: visitorReview ?? this.visitorReview,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'visitorId': visitorId,
      'socCode': socCode,
      'visitorType': visitorType,
      'visitorTypeDetail': visitorTypeDetail,
      'visitorName': visitorName,
      'visitorMobile': visitorMobile,
      'visitorFlatNo': visitorFlatNo,
      'visitorImage': visitorImage,
      'visitorEnterDate': visitorEnterDate,
      'visitorEnterTime': visitorEnterTime,
      'visitorEnterBy': visitorEnterBy,
      'visitorExitDate': visitorExitDate,
      'visitorExitTime': visitorExitTime,
      'visitorExitBy': visitorExitBy,
      'visitorStatus': visitorStatus,
      'visitorIsValidUpdate': visitorIsValidUpdate,
      'visitorApprovReject': visitorApprovReject,
      'visitorAppRejBy': visitorAppRejBy,
      'visitorRejByName': visitorRejByName,
      'visitorIsValid': visitorIsValid,
      'visitorReview': visitorReview,
    };
  }

  factory Visitor.fromMap(Map<String, dynamic> map) {
    return Visitor(
      visitorId: map['visitor_id'] as String,
      socCode: map['soc_code'] as String,
      visitorType: map['visitor_type'] as String,
      visitorTypeDetail: map['visitor_type_detail'] as String,
      visitorName: map['visitor_name'] as String,
      visitorMobile: map['visitor_mobile'] as String,
      visitorFlatNo: map['visitor_flat_no'] as String,
      visitorImage: map['visitor_image'] as String,
      visitorEnterDate: map['visitor_enter_date'] as String,
      visitorEnterTime: map['visitor_enter_time'] as String,
      visitorEnterBy: map['visitor_enter_by'] != null
          ? map['visitor_enter_by'] as String
          : null,
      visitorAppRejBy: map['visitor_app_rej_by'] as String,
      visitorRejByName: map['visitor_app_rej_by_name'] as String,
      visitorApprovReject: map['visitor_approve_reject'] as String,
      visitorIsValidUpdate: map['visitor_is_valid_update'] as String,
      visitorExitDate: map['visitor_exit_date'] != null
          ? map['visitor_exit_date'] as String
          : null,
      visitorExitTime: map['visitor_exit_time'] != null
          ? map['visitor_exit_time'] as String
          : null,
      visitorExitBy: map['visitor_exit_by'] != null
          ? map['visitor_exit_by'] as String
          : null,
      visitorStatus: map['visitor_status'] as String,
      visitorIsValid: map['visitor_is_valid'] as String,
      visitorReview: map['visitor_review'] != null
          ? map['visitor_review'] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Visitor.fromJson(String source) => Visitor.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Visitor(visitorId: $visitorId, socCode: $socCode, visitorType: $visitorType, visitorTypeDetail: $visitorTypeDetail, visitorName: $visitorName, visitorMobile: $visitorMobile, visitorFlatNo: $visitorFlatNo, visitorImage: $visitorImage, visitorEnterDate: $visitorEnterDate, visitorEnterTime: $visitorEnterTime, visitorEnterBy: $visitorEnterBy, visitorExitDate: $visitorExitDate, visitorExitTime: $visitorExitTime, visitorExitBy: $visitorExitBy, visitorStatus: $visitorStatus, visitorIsValidUpdate: $visitorIsValidUpdate, visitorApprovReject: $visitorApprovReject, visitorAppRejBy: $visitorAppRejBy, visitorRejByName: $visitorRejByName, visitorIsValid: $visitorIsValid, visitorReview: $visitorReview)';
  }

  @override
  bool operator ==(covariant Visitor other) {
    if (identical(this, other)) return true;
  
    return 
      other.visitorId == visitorId &&
      other.socCode == socCode &&
      other.visitorType == visitorType &&
      other.visitorTypeDetail == visitorTypeDetail &&
      other.visitorName == visitorName &&
      other.visitorMobile == visitorMobile &&
      other.visitorFlatNo == visitorFlatNo &&
      other.visitorImage == visitorImage &&
      other.visitorEnterDate == visitorEnterDate &&
      other.visitorEnterTime == visitorEnterTime &&
      other.visitorEnterBy == visitorEnterBy &&
      other.visitorExitDate == visitorExitDate &&
      other.visitorExitTime == visitorExitTime &&
      other.visitorExitBy == visitorExitBy &&
      other.visitorStatus == visitorStatus &&
      other.visitorIsValidUpdate == visitorIsValidUpdate &&
      other.visitorApprovReject == visitorApprovReject &&
      other.visitorAppRejBy == visitorAppRejBy &&
      other.visitorRejByName == visitorRejByName &&
      other.visitorIsValid == visitorIsValid &&
      other.visitorReview == visitorReview;
  }

  @override
  int get hashCode {
    return visitorId.hashCode ^
      socCode.hashCode ^
      visitorType.hashCode ^
      visitorTypeDetail.hashCode ^
      visitorName.hashCode ^
      visitorMobile.hashCode ^
      visitorFlatNo.hashCode ^
      visitorImage.hashCode ^
      visitorEnterDate.hashCode ^
      visitorEnterTime.hashCode ^
      visitorEnterBy.hashCode ^
      visitorExitDate.hashCode ^
      visitorExitTime.hashCode ^
      visitorExitBy.hashCode ^
      visitorStatus.hashCode ^
      visitorIsValidUpdate.hashCode ^
      visitorApprovReject.hashCode ^
      visitorAppRejBy.hashCode ^
      visitorRejByName.hashCode ^
      visitorIsValid.hashCode ^
      visitorReview.hashCode;
  }
}
