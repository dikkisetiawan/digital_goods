// To parse this JSON data, do
//
//     final digitalGoodsModel = digitalGoodsModelFromJson(jsonString);

// ignore_for_file: unnecessary_null_in_if_null_operators

import 'dart:convert';

import 'package:equatable/equatable.dart';

DigitalGoodsModel digitalGoodsModelFromJson(String str) =>
    DigitalGoodsModel.fromJson(json.decode(str));

String digitalGoodsModelToJson(DigitalGoodsModel data) =>
    json.encode(data.toJson());

class DigitalGoodsModel {
  DigitalGoodsModel({
    this.xid,
    this.ts,
    this.error,
    this.terminalName,
    this.storeName,
    this.prepaid,
    this.postpaid,
  });

  final String? xid;
  final DateTime? ts;
  final String? error;
  final String? terminalName;
  final String? storeName;
  final List<DigitalGoodsProductsModel>? prepaid;
  final List<DigitalGoodsProductsModel>? postpaid;

  factory DigitalGoodsModel.fromJson(Map<String, dynamic> json) =>
      DigitalGoodsModel(
        xid: json["xid"] ?? null,
        ts: json["ts"] == null ? null : DateTime.parse(json["ts"]),
        error: json["error"] ?? null,
        terminalName: json["terminal_name"] ?? null,
        storeName: json["store_name"] ?? null,
        prepaid: json["prepaid"] == null
            ? null
            : List<DigitalGoodsProductsModel>.from(json["prepaid"]
                .map((x) => DigitalGoodsProductsModel.fromJson(x))),
        postpaid: json["postpaid"] == null
            ? null
            : List<DigitalGoodsProductsModel>.from(json["postpaid"]
                .map((x) => DigitalGoodsProductsModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "xid": xid ?? null,
        "ts": ts == null ? null : ts!.toIso8601String(),
        "error": error ?? null,
        "terminal_name": terminalName ?? null,
        "store_name": storeName ?? null,
        "prepaid": prepaid == null
            ? null
            : List<dynamic>.from(prepaid!.map((x) => x.toJson())),
        "postpaid": postpaid == null
            ? null
            : List<dynamic>.from(postpaid!.map((x) => x.toJson())),
      };
}

class DigitalGoodsProductsModel {
  DigitalGoodsProductsModel({
    this.id,
    this.name,
    this.imageUrl,
    this.brands,
  });

  final int? id;
  final String? name;
  final String? imageUrl;
  final List<BrandModel>? brands;

  factory DigitalGoodsProductsModel.fromJson(Map<String, dynamic> json) =>
      DigitalGoodsProductsModel(
        id: json["id"] ?? null,
        name: json["name"] ?? null,
        imageUrl: json["image_url"] ?? null,
        brands: json["brands"] == null
            ? null
            : List<BrandModel>.from(
                json["brands"].map((x) => BrandModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? null,
        "name": name ?? null,
        "image_url": imageUrl ?? null,
        "brands": brands == null
            ? null
            : List<dynamic>.from(brands!.map((x) => x.toJson())),
      };
}

class BrandModel extends Equatable {
  const BrandModel({
    this.id,
    this.name,
    this.imageUrl,
    this.brandCategoryId,
    this.brandCategoryName,
    this.productCategories,
    this.prefixes,
  });

  final int? id;
  final String? name;
  final String? imageUrl;
  final int? brandCategoryId;
  final String? brandCategoryName;
  final List<ProductCategoryModel>? productCategories;
  final List<String>? prefixes;

  factory BrandModel.fromJson(Map<String, dynamic> json) => BrandModel(
        id: json["id"] ?? null,
        name: json["name"] ?? null,
        imageUrl: json["image_url"] ?? null,
        brandCategoryId: json["brand_category_id"] ?? null,
        brandCategoryName: json["brand_category_name"] ?? null,
        productCategories: json["product_categories"] == null
            ? null
            : List<ProductCategoryModel>.from(json["product_categories"]
                .map((x) => ProductCategoryModel.fromJson(x))),
        prefixes: json["prefixes"] == null
            ? null
            : List<String>.from(json["prefixes"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? null,
        "name": name ?? null,
        "image_url": imageUrl ?? null,
        "brand_category_id": brandCategoryId ?? null,
        "brand_category_name": brandCategoryName ?? null,
        "product_categories": productCategories == null
            ? null
            : List<dynamic>.from(productCategories!.map((x) => x.toJson())),
        "prefixes": prefixes == null
            ? null
            : List<dynamic>.from(prefixes!.map((x) => x)),
      };

  @override
  List<Object?> get props => [
        id,
        name,
        imageUrl,
        brandCategoryId,
        brandCategoryName,
        productCategories,
        prefixes,
      ];
}

class ProductCategoryModel {
  ProductCategoryModel({
    this.id,
    this.name,
    this.products,
  });

  final int? id;
  final Name? name;
  final List<ProductModel>? products;

  factory ProductCategoryModel.fromJson(Map<String, dynamic> json) =>
      ProductCategoryModel(
        id: json["id"] ?? null,
        name: json["name"] == null ? null : nameValues.map![json["name"]],
        products: json["products"] == null
            ? null
            : List<ProductModel>.from(
                json["products"].map((x) => ProductModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? null,
        "name": name == null ? null : nameValues.reverse![name],
        "products": products == null
            ? null
            : List<dynamic>.from(products!.map((x) => x.toJson())),
      };
}

enum Name {
  plnPascaBayar,
  halo,
  telkom,
  pdam,
  bpjsKesehatan,
  pulsa,
  data,
  paketTelpon,
  pln,
  eMoney,
  game
}

final nameValues = EnumValues({
  "BPJS KESEHATAN": Name.bpjsKesehatan,
  "DATA": Name.data,
  "E-MONEY": Name.eMoney,
  "GAME": Name.game,
  "HALO": Name.halo,
  "PAKET TELPON": Name.paketTelpon,
  "PDAM": Name.pdam,
  "PLN": Name.pln,
  "PLN PASCA BAYAR": Name.plnPascaBayar,
  "PULSA": Name.pulsa,
  "TELKOM": Name.telkom
});

class ProductModel {
  ProductModel({
    this.name,
    this.description,
    this.brandId,
    this.brandName,
    this.brandImageUrl,
    this.productCategoryId,
    this.productCategoryName,
    this.postpaid,
    this.free,
    this.price,
  });

  final String? name;
  final String? description;
  final int? brandId;
  final String? brandName;
  final String? brandImageUrl;
  final int? productCategoryId;
  final Name? productCategoryName;
  final int? postpaid;
  final int? free;
  final int? price;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        name: json["name"] ?? null,
        description: json["description"] ?? null,
        brandId: json["brand_id"] ?? null,
        brandName: json["brand_name"] ?? null,
        brandImageUrl: json["brand_image_url"] ?? null,
        productCategoryId: json["product_category_id"] ?? null,
        productCategoryName: json["product_category_name"] == null
            ? null
            : nameValues.map![json["product_category_name"]],
        postpaid: json["postpaid"] ?? null,
        free: json["free"] ?? null,
        price: json["price"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "name": name ?? null,
        "description": description ?? null,
        "brand_id": brandId ?? null,
        "brand_name": brandName ?? null,
        "brand_image_url": brandImageUrl ?? null,
        "product_category_id": productCategoryId ?? null,
        "product_category_name": productCategoryName == null
            ? null
            : nameValues.reverse![productCategoryName],
        "postpaid": postpaid ?? null,
        "free": free ?? null,
        "price": price ?? null,
      };
}

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map!.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
