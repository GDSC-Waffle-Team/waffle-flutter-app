import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:waffle/utilities/constants.dart';

class Authenticator {
  final secureStorage = FlutterSecureStorage();
  authentication(String memberId, password) async {
    const url = Constants.LOGIN_URL;
    try {
      http.Response response = await http.post(Uri.parse(url),
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
    } catch (error) {
      print("error: $error");
      return false;
    }
  }

  classifier(String token) async {
    const url = "http://waffle2.duckdns.org/admin";
    http.Response response = await http.get(Uri.parse(url), headers: {
      "Content-Type": "application/json; Charset=utf-8",
      "Authorization": "Bearer $token"
    });
    if (response.statusCode == 200) {
      var managerData = json.decode(utf8.decode(response.bodyBytes));
      print("classifier200: $managerData");
    }
    if (response.statusCode == 403) {
      const change_url = "http://waffle2.duckdns.org/member";
      http.Response response = await http.get(Uri.parse(change_url), headers: {
        "Content-Type": "application/json; Charset=utf-8",
        "Authorization": "Bearer $token"
      });
      var memberData = json.decode(utf8.decode(response.bodyBytes));
      print("classifier403: $memberData");
      return false;
    }
    return true;
  }
}
