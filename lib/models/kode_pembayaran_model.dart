// ignore_for_file: unnecessary_null_in_if_null_operators

import 'dart:convert';

KodePembayaranModel kodePembayaranModelFromJson(String str) =>
    KodePembayaranModel.fromJson(json.decode(str));

String kodePembayaranModelToJson(KodePembayaranModel data) =>
    json.encode(data.toJson());

class KodePembayaranModel {
  KodePembayaranModel({
    this.code,
    this.success,
    this.message,
    this.data,
  });

  final int? code;
  final bool? success;
  final String? message;
  final Data? data;

  factory KodePembayaranModel.fromJson(Map<String, dynamic> json) =>
      KodePembayaranModel(
        code: json["code"] ?? null,
        success: json["success"] ?? null,
        message: json["message"] ?? null,
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code ?? null,
        "success": success ?? null,
        "message": message ?? null,
        "data": data == null ? null : data!.toJson(),
      };
}

class Data {
  Data({
    this.order,
    this.virtualAccountInfo,
  });

  final Order? order;
  final VirtualAccountInfo? virtualAccountInfo;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        order: json["order"] == null ? null : Order.fromJson(json["order"]),
        virtualAccountInfo: json["virtual_account_info"] == null
            ? null
            : VirtualAccountInfo.fromJson(json["virtual_account_info"]),
      );

  Map<String, dynamic> toJson() => {
        "order": order == null ? null : order!.toJson(),
        "virtual_account_info":
            virtualAccountInfo == null ? null : virtualAccountInfo!.toJson(),
      };
}

class Order {
  Order({
    this.invoiceNumber,
    this.amount,
  });

  final String? invoiceNumber;
  final String? amount;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        invoiceNumber: json["invoice_number"] ?? null,
        amount: json["amount"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "invoice_number": invoiceNumber ?? null,
        "amount": amount ?? null,
      };
}

class VirtualAccountInfo {
  VirtualAccountInfo({
    this.virtualAccountNumber,
    this.howToPayPage,
    this.howToPayApi,
    this.createdDate,
    this.expiredDate,
    this.createdDateUtc,
    this.expiredDateUtc,
    this.virtualAccountName,
  });

  final String? virtualAccountNumber;
  final String? howToPayPage;
  final String? howToPayApi;
  final String? createdDate;
  final String? expiredDate;
  final DateTime? createdDateUtc;
  final DateTime? expiredDateUtc;
  final String? virtualAccountName;

  factory VirtualAccountInfo.fromJson(Map<String, dynamic> json) =>
      VirtualAccountInfo(
        virtualAccountNumber: json["virtual_account_number"] ?? null,
        howToPayPage: json["how_to_pay_page"] ?? null,
        howToPayApi: json["how_to_pay_api"] ?? null,
        createdDate: json["created_date"] ?? null,
        expiredDate: json["expired_date"] ?? null,
        createdDateUtc: json["created_date_utc"] == null
            ? null
            : DateTime.parse(json["created_date_utc"]),
        expiredDateUtc: json["expired_date_utc"] == null
            ? null
            : DateTime.parse(json["expired_date_utc"]),
        virtualAccountName: json["virtual_account_name"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "virtual_account_number": virtualAccountNumber ?? null,
        "how_to_pay_page": howToPayPage ?? null,
        "how_to_pay_api": howToPayApi ?? null,
        "created_date": createdDate ?? null,
        "expired_date": expiredDate ?? null,
        "created_date_utc":
            createdDateUtc == null ? null : createdDateUtc!.toIso8601String(),
        "expired_date_utc":
            expiredDateUtc == null ? null : expiredDateUtc!.toIso8601String(),
        "virtual_account_name": virtualAccountName ?? null,
      };
}
