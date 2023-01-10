class Fines {
  String? memberId;
  int? id;
  String? date;
  String? type;
  bool? status;

  Fines({this.id, this.memberId, this.date, this.type, this.status});

  Fines.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    memberId = json["memberId"];
    date = json["date"];
    type = json["type"];
    status = json["status"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = id;
    data["memberId"] = memberId;
    data["date"] = date;
    data["type"] = type;
    data["status"] = status;
    return data;
  }

  int? getId() {
    return this.id;
  }
}
