import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:waffle/providers/fine_list.dart';
import 'package:waffle/providers/member_data.dart';
import 'package:waffle/providers/members_list.dart';
import 'package:waffle/utilities/constants.dart';
import 'package:waffle/utilities/converter.dart';

class HttpServices {
  final url = Constants.ADMIN_PATH;
  static final secureStorage = FlutterSecureStorage();

  /**MARK: GET FINES SERVICE ONLY MEMBER */
  Future<MemberData> getFines() async {
    const member_url = Constants.MEMBER_PATH;
    String? token = await secureStorage.read(key: "loginKey");
    var response = await http.get(Uri.parse(member_url), headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    });

    if (response.statusCode == 200) {
      var code = response.statusCode;
      print("getFines: $code");
    } else {
      print("getFines: 서버와의 통신에 실패했어요.");
    }
    var data = json.decode(utf8.decode(response.bodyBytes));
    return MemberData.fromJson(data);
  }

  /**MARK: GET ALL MEMBER LIST SERVICE ONLY ADMIN*/
  Future<MembersList> getMembers() async {
    String? token = await secureStorage.read(key: "loginKey");
    var response = await http.get(Uri.parse(url), headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    });

    if (response.statusCode == 200) {
      final data = await json.decode(utf8.decode(response.bodyBytes));
      print("getMembers: $data");
    }
    List datalist = json.decode(utf8.decode(response.bodyBytes));
    var data = MembersList.fromJson(datalist);
    return data;
  }

  /**MARK: CREATE SERVICE FOR ADMIN*/
  createFines(memberId, date, type) async {
    Converters converters = Converters();
    String? token = await secureStorage.read(key: "loginKey");
    var createKey = converters.nicknameConverter(memberId);
    var create_url = url + "/$createKey";
    try {
      var response = await http.post(Uri.parse(create_url),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token"
          },
          body: jsonEncode({
            "memberId": converters.nicknameConverter(memberId),
            "date": date,
            "type": converters.untypeConverter(type)
          }),
          encoding: Encoding.getByName("utf-8"));
      if (response.statusCode == 200) {
        print("벌금 내역을 추가했어요.");
        return true;
      } else {
        print("추가를 실패했어요.");
        return false;
      }
    } catch (error) {
      print("createFines error: $error");
    }
  }

  /**MARK: DELETE SERVICE FOR ADMIN*/
  deleteFines(String id, String memberId) async {
    String? token = await secureStorage.read(key: "loginKey");
    var response = await http.delete(Uri.parse(url + "/${memberId}"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        },
        body: jsonEncode({"id": id}));

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  /**MARK: PUT SERVICE FOR ADMIN*/
  patchStatus(String id, String memberId) async {
    String? token = await secureStorage.read(key: "loginKey");
    var response = await http.patch(Uri.parse(url + "/${memberId}"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        },
        body: jsonEncode({"id": id}));

    if (response.statusCode == 200) {
      print(response.body);
      return true;
    } else {
      print(response.statusCode);
      return false;
    }
  }

  /**MARK: GET ALL MEMBER LIST SERVICE ONLY ADMIN*/
  Future<FineList> getRecent() async {
    const test_url = "http://waffle2.duckdns.org/admin/list";
    String? token = await secureStorage.read(key: "loginKey");
    var response = await http.get(Uri.parse(test_url), headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    });

    if (response.statusCode == 200) {
      final data = await json.decode(utf8.decode(response.bodyBytes));
      print("getMembers: $data");
    }
    var data = await json.decode(utf8.decode(response.bodyBytes));
    print("data: $data");
    return FineList.fromJson(data);
  }

  /**MARK: GET ALL MEMBER LIST SERVICE ONLY ADMIN*/
  Future<FineList> getDetail(String memberId) async {
    const detail_url = "http://waffle2.duckdns.org/admin/";
    String? token = await secureStorage.read(key: "loginKey");
    var response = await http.get(Uri.parse(detail_url + "$memberId"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        });

    if (response.statusCode == 200) {
      final data = await json.decode(utf8.decode(response.bodyBytes));
      print("getMembers: $data");
    }
    var data = await json.decode(utf8.decode(response.bodyBytes));
    return FineList.fromJson(data);
  }
}
