// To parse this JSON data, do
//
//     final generatePaymentCode = generatePaymentCodeFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

GeneratePaymentCodeModel generatePaymentCodeFromJson(String str) =>
    GeneratePaymentCodeModel.fromJson(json.decode(str));

String generatePaymentCodeToJson(GeneratePaymentCodeModel data) =>
    json.encode(data.toJson());

class GeneratePaymentCodeModel extends Equatable {
  GeneratePaymentCodeModel({
    this.order,
    this.virtualAccountInfo,
  });

  final OrderModel? order;
  final VirtualAccountInfoModel? virtualAccountInfo;

  factory GeneratePaymentCodeModel.fromJson(Map<String, dynamic> json) =>
      GeneratePaymentCodeModel(
        order:
            json["order"] == null ? null : OrderModel.fromJson(json["order"]),
        virtualAccountInfo: json["virtual_account_info"] == null
            ? null
            : VirtualAccountInfoModel.fromJson(json["virtual_account_info"]),
      );

  Map<String, dynamic> toJson() => {
        "order": order == null ? null : order!.toJson(),
        "virtual_account_info":
            virtualAccountInfo == null ? null : virtualAccountInfo!.toJson(),
      };

  @override
  // TODO: implement props
  List<Object?> get props => [
        order,
        virtualAccountInfo,
      ];
}

class OrderModel extends Equatable {
  OrderModel({
    this.invoiceNumber,
    this.amount,
  });

  final String? invoiceNumber;
  final String? amount;

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        invoiceNumber: json["invoice_number"] ?? null,
        amount: json["amount"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "invoice_number": invoiceNumber ?? null,
        "amount": amount ?? null,
      };

  @override
  // TODO: implement props
  List<Object?> get props => [
        invoiceNumber,
        amount,
      ];
}

class VirtualAccountInfoModel extends Equatable {
  VirtualAccountInfoModel({
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

  factory VirtualAccountInfoModel.fromJson(Map<String, dynamic> json) =>
      VirtualAccountInfoModel(
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

  @override
  // TODO: implement props
  List<Object?> get props => [
        virtualAccountNumber,
        howToPayPage,
        howToPayApi,
        createdDate,
        expiredDate,
        createdDateUtc,
        expiredDateUtc,
        virtualAccountName,
      ];
}
