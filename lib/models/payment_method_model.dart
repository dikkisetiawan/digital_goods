// ignore_for_file: unnecessary_null_in_if_null_operators

import 'dart:convert';

List<PaymentMethodModel> metodePembayaranModelFromJson(String str) {
  return List<PaymentMethodModel>.from(
      json.decode(str).map((x) => PaymentMethodModel.fromJson(x)));
}

String metodePembayaranModelToJson(List<PaymentMethodModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PaymentMethodModel {
  PaymentMethodModel({this.id, this.name, this.type, this.imagePath});

  final int? id;
  final String? name;
  final Type? type;
  final String? imagePath;

  factory PaymentMethodModel.fromJson(Map<String, dynamic> json) =>
      PaymentMethodModel(
        id: json["id"] ?? null,
        name: json["name"] ?? null,
        type: json["type"] == null ? null : typeValues.map[json["type"]],
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? null,
        "name": name ?? null,
        "type": type == null ? null : typeValues.reverse![type],
      };
}

enum Type { va, merchant, wallet }

final typeValues =
    EnumValues({"O2O": Type.merchant, "VA": Type.va, "wallet": Type.wallet});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
