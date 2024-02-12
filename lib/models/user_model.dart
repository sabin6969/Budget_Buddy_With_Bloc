class UserModel {
  String? about;
  String? userName;
  String? profileImageUrl;
  String? email;

  UserModel(
      {this.about = "Hey i am using Budget Buddy",
      this.userName,
      this.profileImageUrl = "",
      this.email});

  UserModel.fromJson(Map<String, dynamic> json) {
    about = json["about"];
    userName = json["UserModelName"];
    profileImageUrl = json["profileImageUrl"];
    email = json["email"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["about"] = about;
    data["UserModelName"] = userName;
    data["profileImageUrl"] = profileImageUrl;
    data["email"] = email;
    return data;
  }
}
