class LoginResponseModel {
  final String username;
  final String address;
  final String phone;
  final String ownerName;
  final String profilePic;
  final String cardType;

  LoginResponseModel(
      {this.username,
      this.address,
      this.phone,
      this.ownerName,
      this.profilePic,
      this.cardType});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      username: json["username"] != null ? json["username"] : "",
      address: json["address"] != null ? json["address"] : "",
      phone: json["contact_no"] != null ? json["contact_no"] : "",
      ownerName: json["owner_name"] != null ? json["owner_name"] : "",
      profilePic: json["profile_pic"] != null ? json["profile_pic"] : "",
      cardType: json["CardType"] != null ? json["CardType"] : "",
    );
  }
}

class LoginRequestModel {
  String phone;
  String password;

  LoginRequestModel({
    this.phone,
    this.password,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "login_id": phone.trim(),
      "login_pwd": password.trim()
    };
    return map;
  }
}
