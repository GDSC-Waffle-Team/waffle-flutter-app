class Authentication {
  String? memberId;
  String? password;

  Authentication({this.memberId, this.password});

  Authentication.fromJson(Map<String, dynamic> json) {
    memberId = json["memberId"];
    password = json["password"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["memberId"] = memberId;
    data["password"] = password;
    return data;
  }
}
