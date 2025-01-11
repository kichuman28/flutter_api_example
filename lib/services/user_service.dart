// Created by: Adwaith Jayasankar, Created at: 06-01-2025 22:13
import 'package:counter/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class UserService {
  static Future<UserModel?> getUser(String userID) async {
    var client = http.Client();

    var url = Uri.parse("https://2fa0d036-25f8-4bc9-80a4-ff1726e4e097.mock.pstmn.io/caddayn/mock/users/$userID");
    try {
      var response = await client.get(url);
      if (response.statusCode == 200) {
        print(response.statusCode);
        var json = response.body;
        print(json);
        return welcomeFromJson(json);
      } else if (response.statusCode == 404) {
        //I know both these if else statements return the same things, I kept it that way to ask a doubt regarding the api. So currently not removing it as of now.
        print(response.statusCode);
        var json = response.body;
        print(json);
        return welcomeFromJson(json);
      } else {
        print(response.statusCode);
      }
    } catch (error) {
      print(error);
    }
    return null;
  }
}
