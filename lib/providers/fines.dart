class Fines {
  int? id;
  String? memberId;
  String? date;
  String? type;
  bool? status;

  Fines({this.id, this.memberId, this.date, this.type, this.status});

  Fines.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    memberId = json['memberId'];
    date = json['date'];
    type = json['type'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['memberId'] = this.memberId;
    data['date'] = this.date;
    data['type'] = this.type;
    data['status'] = this.status;
    return data;
  }
}
