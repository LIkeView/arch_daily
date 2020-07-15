import 'ApiResponse.dart';
import 'ListEvent.dart';
import 'ProfileDetail.dart';

class ResData {
  ResData({
    this.profileDetails,
    this.listEvent,

  });
  List<ListEventElement> listEvent;

  List<ProfileDetail> profileDetails;

  factory ResData.fromJson(Map<String, dynamic> json) => ResData(
    profileDetails: List<ProfileDetail>.from(json["profile_details"].map((x) => ProfileDetail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "profile_details": List<dynamic>.from(profileDetails.map((x) => x.toJson())),
  };


}
