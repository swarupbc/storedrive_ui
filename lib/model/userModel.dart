// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

List<UserModel> userModelFromJson(String str) =>
    List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
  UserModel({
    this.userId,
    this.username,
    this.address,
    this.contactNo,
    this.ownerName,
    this.emailId,
    this.typeId,
    this.districtId,
    this.pin,
    this.loginId,
    this.regCode,
    this.profilePic,
    this.loginPwd,
    this.userStatus,
    this.cardType,
    this.firebaseKey,
    this.regDate,
  });

  String userId;
  String username;
  String address;
  String contactNo;
  String ownerName;
  String emailId;
  String typeId;
  String districtId;
  String pin;
  String loginId;
  String regCode;
  String profilePic;
  String loginPwd;
  String userStatus;
  String cardType;
  dynamic firebaseKey;
  DateTime regDate;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        userId: json["user_id"],
        username: json["username"],
        address: json["address"],
        contactNo: json["contact_no"],
        ownerName: json["owner_name"],
        emailId: json["email_id"],
        typeId: json["type_id"],
        districtId: json["district_id"],
        pin: json["pin"],
        loginId: json["login_id"],
        regCode: json["reg_code"],
        profilePic: json["profile_pic"],
        loginPwd: json["login_pwd"],
        userStatus: json["UserStatus"],
        cardType: json["CardType"],
        firebaseKey: json["firebase_key"],
        regDate: DateTime.parse(json["reg_date"]),
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "username": username,
        "address": address,
        "contact_no": contactNo,
        "owner_name": ownerName,
        "email_id": emailId,
        "type_id": typeId,
        "district_id": districtId,
        "pin": pin,
        "login_id": loginId,
        "reg_code": regCode,
        "profile_pic": profilePic,
        "login_pwd": loginPwd,
        "UserStatus": userStatus,
        "CardType": cardType,
        "firebase_key": firebaseKey,
        "reg_date": regDate.toIso8601String(),
      };
}
