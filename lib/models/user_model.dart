// Created by: Adwaith Jayasankar, Created at: 06-01-2025 22:02
import 'dart:convert';

UserModel welcomeFromJson(String str) => UserModel.fromJson(json.decode(str));

String welcomeToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    required this.success,
    this.data,
    this.error,
  });

  bool success;
  Data? data;
  String? error;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        success: json["success"] ?? false,
        data: json["data"] != null ? Data.fromJson(json["data"]) : null,
        error: json["error"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data?.toJson(),
        "error": error,
      };
}

class Data {
  User user;
  String message;

  Data({
    required this.user,
    required this.message,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: User.fromJson(json["user"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "message": message,
      };
}

class User {
  int userId;
  String name;
  int age;
  String profession;
  String profileImage;

  User({
    required this.userId,
    required this.name,
    required this.age,
    required this.profession,
    required this.profileImage,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        userId: json["user_id"],
        name: json["name"],
        age: json["age"],
        profession: json["profession"],
        profileImage: json["profile_image"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "name": name,
        "age": age,
        "profession": profession,
        "profile_image": profileImage,
      };
}
