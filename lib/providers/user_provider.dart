// Created by: Adwaith Jayasankar, Created at: 14-01-2025 18:00
import 'package:counter/enums/api_status_enum.dart';
import 'package:counter/models/user_model.dart';
import 'package:flutter/material.dart';
import '../services/user_service.dart';

class UserProvider extends ChangeNotifier {
  Status status = Status.initial;
  UserModel? info;

  void getData(String userID) async {
    status = Status.loading;
    notifyListeners();
    print("Hello");
    info = await UserService.getUser(userID);
    if (info != null && info!.success) {
      status = Status.success;
    } else {
      status = Status.error;
    }
    print("Hello there");
    notifyListeners();
  }
}
