import 'package:waffle/providers/manager_data.dart';

class MembersList {
  List<MembersData> membersData;

  MembersList({required this.membersData});

  factory MembersList.fromJson(List<dynamic> json) {
    List<MembersData> membersList = <MembersData>[];
    membersList = json.map((v) => MembersData.fromJson(v)).toList();
    return MembersList(membersData: membersList);
  }
}
