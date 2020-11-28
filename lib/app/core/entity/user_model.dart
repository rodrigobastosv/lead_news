import 'package:lead_news/app/core/dio.dart';

class UserModel {
  UserModel({
    this.id,
    this.name,
    this.email,
    this.imageUrl,
    this.isAdmin,
    this.key,
  });

  String id;
  String name;
  String email;
  String imageUrl;
  bool isAdmin;
  String key;

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    imageUrl = json['imageUrl'];
    isAdmin = json['admin'] ?? false;
    key = apiKey;
  }
}
