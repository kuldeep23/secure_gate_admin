// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
class Wrongvisitor {
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
  final String? visitorExitDate;
  final String? visitorExitTime;
  final String visitorApproveBy;
  final String visitorStatus;
  final String visitorIsValid;
  final String visitorReview;
  Wrongvisitor({
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
    this.visitorExitDate,
    this.visitorExitTime,
    required this.visitorApproveBy,
    required this.visitorStatus,
    required this.visitorIsValid,
    required this.visitorReview,
  });

  Wrongvisitor copyWith({
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
    String? visitorExitDate,
    String? visitorExitTime,
    String? visitorApproveBy,
    String? visitorStatus,
    String? visitorIsValid,
    String? visitorReview,
  }) {
    return Wrongvisitor(
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
      visitorExitDate: visitorExitDate ?? this.visitorExitDate,
      visitorExitTime: visitorExitTime ?? this.visitorExitTime,
      visitorApproveBy: visitorApproveBy ?? this.visitorApproveBy,
      visitorStatus: visitorStatus ?? this.visitorStatus,
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
      'visitorExitDate': visitorExitDate,
      'visitorExitTime': visitorExitTime,
      'visitorApproveBy': visitorApproveBy,
      'visitorStatus': visitorStatus,
      'visitorIsValid': visitorIsValid,
      'visitorReview': visitorReview,
    };
  }

  factory Wrongvisitor.fromMap(Map<String, dynamic> map) {
    return Wrongvisitor(
      visitorId: map['visitorId'] as String,
      socCode: map['socCode'] as String,
      visitorType: map['visitorType'] as String,
      visitorTypeDetail: map['visitorTypeDetail'] as String,
      visitorName: map['visitorName'] as String,
      visitorMobile: map['visitorMobile'] as String,
      visitorFlatNo: map['visitorFlatNo'] as String,
      visitorImage: map['visitorImage'] as String,
      visitorEnterDate: map['visitorEnterDate'] as String,
      visitorEnterTime: map['visitorEnterTime'] as String,
      visitorExitDate: map['visitorExitDate'] != null ? map['visitorExitDate'] as String : null,
      visitorExitTime: map['visitorExitTime'] != null ? map['visitorExitTime'] as String : null,
      visitorApproveBy: map['visitorApproveBy'] as String,
      visitorStatus: map['visitorStatus'] as String,
      visitorIsValid: map['visitorIsValid'] as String,
      visitorReview: map['visitorReview'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Wrongvisitor.fromJson(String source) => Wrongvisitor.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Wrongvisitor(visitorId: $visitorId, socCode: $socCode, visitorType: $visitorType, visitorTypeDetail: $visitorTypeDetail, visitorName: $visitorName, visitorMobile: $visitorMobile, visitorFlatNo: $visitorFlatNo, visitorImage: $visitorImage, visitorEnterDate: $visitorEnterDate, visitorEnterTime: $visitorEnterTime, visitorExitDate: $visitorExitDate, visitorExitTime: $visitorExitTime, visitorApproveBy: $visitorApproveBy, visitorStatus: $visitorStatus, visitorIsValid: $visitorIsValid, visitorReview: $visitorReview)';
  }

  @override
  bool operator ==(covariant Wrongvisitor other) {
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
      other.visitorExitDate == visitorExitDate &&
      other.visitorExitTime == visitorExitTime &&
      other.visitorApproveBy == visitorApproveBy &&
      other.visitorStatus == visitorStatus &&
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
      visitorExitDate.hashCode ^
      visitorExitTime.hashCode ^
      visitorApproveBy.hashCode ^
      visitorStatus.hashCode ^
      visitorIsValid.hashCode ^
      visitorReview.hashCode;
  }
}
