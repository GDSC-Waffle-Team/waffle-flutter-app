import 'package:waffle/providers/fines.dart';

class MembersData {
  String? memberId;
  String? nickname;
  String? part;
  List<Fines>? fines;

  MembersData({this.memberId, this.nickname, this.part, this.fines});

  MembersData.fromJson(Map<String, dynamic> json) {
    memberId = json['memberId'];
    nickname = json['nickname'];
    part = json['part'];
    if (json['fines'] != null) {
      fines = <Fines>[];
      json['fines'].forEach((v) {
        fines!.add(new Fines.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['memberId'] = this.memberId;
    data['nickname'] = this.nickname;
    data['part'] = this.part;
    if (this.fines != null) {
      data['fines'] = this.fines!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
