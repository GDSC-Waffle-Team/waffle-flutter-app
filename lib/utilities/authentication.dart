import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:waffle/utilities/constants.dart';

class Authenticator {
  final secureStorage = FlutterSecureStorage();
  authentication(String memberId, password) async {
    const url = Constants.LOGIN_URL;
    var response = await http.post(Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "memberId": memberId,
          "password": password,
        }),
        encoding: Encoding.getByName("utf-8"));

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      print(responseBody);
      String? token = responseBody["accessToken"];
      await secureStorage.write(key: "loginKey", value: token);
      print(token);
      return true;
    } else {
      return false;
    }
  }

  classifier(token) async {
    const URL = "http://waffle2.duckdns.org/admin";
    var resManager = await http.get(Uri.parse(URL), headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    });
    if (resManager.statusCode == 200) {
      var managerData = json.decode(utf8.decode(resManager.bodyBytes));
      print("classifier200: $managerData");
      return true;
    } else if (resManager.statusCode == 403) {
      const CHANGE_URL = "http://waffle2.duckdns.org/member";
      var resMember = await http.get(Uri.parse(CHANGE_URL), headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      });
      if (resMember.statusCode == 200) {
        var memberData = json.decode(utf8.decode(resMember.bodyBytes));
        print("classifier403: $memberData");
      }
      return false;
    }
  }
}
