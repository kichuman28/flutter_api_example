// Created by: Adwaith Jayasankar, Created at: 06-01-2025 22:13
import 'package:counter/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class UserService {
  Future<Welcome?> getUser(String userID) async {
    var client = http.Client();

    var url = Uri.parse("https://2fa0d036-25f8-4bc9-80a4-ff1726e4e097.mock.pstmn.io/caddayn/mock/users/$userID");
    var response = await client.get(url);
    if (response.statusCode == 200) {
      var json = response.body;
      print(json);
      return welcomeFromJson(json);
    }
    return null;
  }
}
