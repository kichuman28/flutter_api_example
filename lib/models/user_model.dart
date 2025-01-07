// Created by: Adwaith Jayasankar, Created at: 06-01-2025 22:02
import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  bool success;
  Data data;
  dynamic error;

  Welcome({
    required this.success,
    required this.data,
    this.error,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        success: json["success"],
        data: Data.fromJson(json["data"]),
        error: json["error"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
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
