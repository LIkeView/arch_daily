class ProfileDetail {
  ProfileDetail({
    this.userId,
    this.name,
    this.userName,
    this.mobile,
    this.email,
    this.profilePic,
    this.profilePicPath,
    this.gender,
    this.webUrl,
    this.companyName,
    this.profession,
    this.address,
    this.city,
    this.state,
    this.country,
    this.pinCode,
    this.status,
    this.createdDate,
    this.updatedDate,
  });

  String userId;
  String name;
  String userName;
  String mobile;
  String email;
  String profilePic;
  String profilePicPath;
  String gender;
  String webUrl;
  String companyName;
  String profession;
  String address;
  String city;
  String state;
  String country;
  String pinCode;
  String status;
  DateTime createdDate;
  DateTime updatedDate;

  factory ProfileDetail.fromJson(Map<String, dynamic> json) => ProfileDetail(
    userId: json["user_id"],
    name: json["name"],
    userName: json["user_name"],
    mobile: json["mobile"],
    email: json["email"],
    profilePic: json["profile_pic"],
    profilePicPath: json["profile_pic_path"],
    gender: json["gender"],
    webUrl: json["web_url"],
    companyName: json["company_name"],
    profession: json["profession"],
    address: json["address"],
    city: json["city"],
    state: json["state"],
    country: json["country"],
    pinCode: json["pin_code"],
    status: json["status"],
    createdDate: DateTime.parse(json["created_date"]),
    updatedDate: DateTime.parse(json["updated_date"]),
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "name": name,
    "user_name": userName,
    "mobile": mobile,
    "email": email,
    "profile_pic": profilePic,
    "profile_pic_path": profilePicPath,
    "gender": gender,
    "web_url": webUrl,
    "company_name": companyName,
    "profession": profession,
    "address": address,
    "city": city,
    "state": state,
    "country": country,
    "pin_code": pinCode,
    "status": status,
    "created_date": createdDate.toIso8601String(),
    "updated_date": updatedDate.toIso8601String(),
  };
}
