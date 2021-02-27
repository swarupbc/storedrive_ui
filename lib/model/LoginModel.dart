class UserModel {
  String username;
  String address;
  String contactNo;
  String ownerName;
  String profilePic;
  String cardType;

  UserModel(
      {this.username,
      this.address,
      this.contactNo,
      this.ownerName,
      this.profilePic,
      this.cardType});

  UserModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    address = json['address'];
    contactNo = json['contact_no'];
    ownerName = json['owner_name'];
    profilePic = json['profile_pic'];
    cardType = json['CardType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['address'] = this.address;
    data['contact_no'] = this.contactNo;
    data['owner_name'] = this.ownerName;
    data['profile_pic'] = this.profilePic;
    data['CardType'] = this.cardType;
    return data;
  }
}
