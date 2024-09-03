import 'dart:convert';
import 'package:wisata_ticketing/features/authentication/domain/entities/user.dart';

class AuthResponseModel {
  final String? status;
  final String? message;
  final Data? data;

  AuthResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory AuthResponseModel.fromJson(String str) =>
      AuthResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AuthResponseModel.fromMap(Map<String, dynamic> json) =>
      AuthResponseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
    "status": status,
    "message": message,
    "data": data?.toMap(),
  };
}

class Data {
  final User? user;
  final String? token;

  Data({
    this.user,
    this.token,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
    user: json["user"] == null ? null : User.fromMap(json["user"]),
    token: json["token"],
  );

  Map<String, dynamic> toMap() => {
    "user": user?.toMap(),
    "token": token,
  };
}
