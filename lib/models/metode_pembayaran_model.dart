import 'dart:convert';

List<MetodePembayaranModel> metodePembayaranModelFromJson(String str) =>
    List<MetodePembayaranModel>.from(
        json.decode(str).map((x) => MetodePembayaranModel.fromJson(x)));

String metodePembayaranModelToJson(List<MetodePembayaranModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MetodePembayaranModel {
  MetodePembayaranModel({this.id, this.name, this.type, this.imagePath});

  final int? id;
  final String? name;
  final Type? type;
  final String? imagePath;

  factory MetodePembayaranModel.fromJson(Map<String, dynamic> json) =>
      MetodePembayaranModel(
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
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
