// ignore_for_file: unnecessary_null_in_if_null_operators

import 'dart:convert';

import 'package:equatable/equatable.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel extends Equatable {
  const UserModel({
    this.id,
    this.name,
    this.email,
    this.username,
    this.phone,
    this.type,
    this.accType,
    this.isActive,
    this.rememberToken,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  final int? id;
  final String? name;
  final String? email;
  final String? username;
  final String? phone;
  final String? type;
  final String? accType;
  final int? isActive;
  final String? rememberToken;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"] ?? null,
        name: json["name"] ?? null,
        email: json["email"] ?? null,
        username: json["username"] ?? null,
        phone: json["phone"] ?? null,
        type: json["type"] ?? null,
        accType: json["acc_type"] ?? null,
        isActive: json["is_active"] ?? null,
        rememberToken: json["remember_token"] ?? null,
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"] == null
            ? null
            : DateTime.parse(json["deleted_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? null,
        "name": name ?? null,
        "email": email ?? null,
        "username": username ?? null,
        "phone": phone ?? null,
        "type": type ?? null,
        "acc_type": accType ?? null,
        "is_active": isActive ?? null,
        "remember_token": rememberToken ?? null,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "deleted_at": deletedAt == null ? null : deletedAt!.toIso8601String(),
      };

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        username,
        phone,
        type,
        accType,
        isActive,
        rememberToken,
        createdAt,
        updatedAt,
        deletedAt,
      ];
}

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.accessToken,
    this.tokenType,
    this.expiresIn,
    this.type,
    this.accType,
  });

  String? accessToken;
  final String? tokenType;
  final int? expiresIn;
  final String? type;
  final String? accType;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        accessToken: json["access_token"] ?? null,
        tokenType: json["token_type"] ?? null,
        expiresIn: json["expires_in"] ?? null,
        type: json["type"] ?? null,
        accType: json["acc_type"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken ?? null,
        "token_type": tokenType ?? null,
        "expires_in": expiresIn ?? null,
        "type": type ?? null,
        "acc_type": accType ?? null,
      };
}
