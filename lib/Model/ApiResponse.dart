// To parse this JSON data, do
//
//     final apiResponse = apiResponseFromJson(jsonString);

import 'dart:convert';

import 'ResData.dart';

ApiResponse apiResponseFromJson(String str) => ApiResponse.fromJson(json.decode(str));

String apiResponseToJson(ApiResponse data) => json.encode(data.toJson());

class ApiResponse {
  ApiResponse({
    this.resCode,
    this.resMessage,
    this.resData,
  });

  int resCode;
  String resMessage;
  ResData resData;

  factory ApiResponse.fromJson(Map<String, dynamic> json) => ApiResponse(
    resCode: json["res_code"],
    resMessage: json["res_message"],
    resData: ResData.fromJson(json["res_data"]),
  );

  Map<String, dynamic> toJson() => {
    "res_code": resCode,
    "res_message": resMessage,
    "res_data": resData.toJson(),
  };
}

//class ResData {
//  ResData({
//    this.profileDetails,
//  });
//
//  List<ProfileDetail> profileDetails;
//
//  factory ResData.fromJson(Map<String, dynamic> json) => ResData(
//    profileDetails: List<ProfileDetail>.from(json["profile_details"].map((x) => ProfileDetail.fromJson(x))),
//  );
//
//  Map<String, dynamic> toJson() => {
//    "profile_details": List<dynamic>.from(profileDetails.map((x) => x.toJson())),
//  };
//}
//
//class ProfileDetail {
//  ProfileDetail({
//    this.userId,
//    this.name,
//    this.userName,
//    this.mobile,
//    this.email,
//    this.profilePic,
//    this.profilePicPath,
//    this.gender,
//    this.webUrl,
//    this.companyName,
//    this.profession,
//    this.address,
//    this.city,
//    this.state,
//    this.country,
//    this.pinCode,
//    this.status,
//    this.createdDate,
//    this.updatedDate,
//  });
//
//  String userId;
//  String name;
//  String userName;
//  String mobile;
//  String email;
//  String profilePic;
//  String profilePicPath;
//  String gender;
//  String webUrl;
//  String companyName;
//  String profession;
//  String address;
//  String city;
//  String state;
//  String country;
//  String pinCode;
//  String status;
//  DateTime createdDate;
//  DateTime updatedDate;
//
//  factory ProfileDetail.fromJson(Map<String, dynamic> json) => ProfileDetail(
//    userId: json["user_id"],
//    name: json["name"],
//    userName: json["user_name"],
//    mobile: json["mobile"],
//    email: json["email"],
//    profilePic: json["profile_pic"],
//    profilePicPath: json["profile_pic_path"],
//    gender: json["gender"],
//    webUrl: json["web_url"],
//    companyName: json["company_name"],
//    profession: json["profession"],
//    address: json["address"],
//    city: json["city"],
//    state: json["state"],
//    country: json["country"],
//    pinCode: json["pin_code"],
//    status: json["status"],
//    createdDate: DateTime.parse(json["created_date"]),
//    updatedDate: DateTime.parse(json["updated_date"]),
//  );
//
//  Map<String, dynamic> toJson() => {
//    "user_id": userId,
//    "name": name,
//    "user_name": userName,
//    "mobile": mobile,
//    "email": email,
//    "profile_pic": profilePic,
//    "profile_pic_path": profilePicPath,
//    "gender": gender,
//    "web_url": webUrl,
//    "company_name": companyName,
//    "profession": profession,
//    "address": address,
//    "city": city,
//    "state": state,
//    "country": country,
//    "pin_code": pinCode,
//    "status": status,
//    "created_date": createdDate.toIso8601String(),
//    "updated_date": updatedDate.toIso8601String(),
//  };
//}
