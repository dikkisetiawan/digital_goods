// To parse this JSON data, do
//
//     final createTransactionModel = createTransactionModelFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

CreateTransactionModel createTransactionModelFromJson(String str) =>
    CreateTransactionModel.fromJson(json.decode(str));

String createTransactionModelToJson(CreateTransactionModel data) =>
    json.encode(data.toJson());

class CreateTransactionModel extends Equatable {
  CreateTransactionModel({
    this.userId,
    this.total,
    this.note,
    this.transactionType,
    this.productType,
    this.meta,
    this.invoiceNumber,
    this.updatedAt,
    this.createdAt,
    this.id,
    this.bookingData,
  });

  final int? userId;
  final int? total;
  final String? note;
  final String? transactionType;
  final String? productType;
  final Meta? meta;
  final String? invoiceNumber;
  final DateTime? updatedAt;
  final DateTime? createdAt;
  final int? id;
  final List<dynamic>? bookingData;

  CreateTransactionModel copyWith({
    int? userId,
    int? total,
    String? note,
    String? transactionType,
    String? productType,
    Meta? meta,
    String? invoiceNumber,
    DateTime? updatedAt,
    DateTime? createdAt,
    int? id,
    List<dynamic>? bookingData,
  }) =>
      CreateTransactionModel(
        userId: userId ?? this.userId,
        total: total ?? this.total,
        note: note ?? this.note,
        transactionType: transactionType ?? this.transactionType,
        productType: productType ?? this.productType,
        meta: meta ?? this.meta,
        invoiceNumber: invoiceNumber ?? this.invoiceNumber,
        updatedAt: updatedAt ?? this.updatedAt,
        createdAt: createdAt ?? this.createdAt,
        id: id ?? this.id,
        bookingData: bookingData ?? this.bookingData,
      );

  factory CreateTransactionModel.fromJson(Map<String, dynamic> json) =>
      CreateTransactionModel(
        userId: json["user_id"] ?? null,
        total: json["total"] ?? null,
        note: json["note"] ?? null,
        transactionType: json["transaction_type"] ?? null,
        productType: json["product_type"] ?? null,
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
        invoiceNumber: json["invoice_number"] ?? null,
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        id: json["id"] ?? null,
        bookingData: json["booking_data"] == null
            ? null
            : List<dynamic>.from(json["booking_data"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId ?? null,
        "total": total ?? null,
        "note": note ?? null,
        "transaction_type": transactionType ?? null,
        "product_type": productType ?? null,
        "meta": meta == null ? null : meta!.toJson(),
        "invoice_number": invoiceNumber ?? null,
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "id": id ?? null,
        "booking_data": bookingData == null
            ? null
            : List<dynamic>.from(bookingData!.map((x) => x)),
      };

  @override
  // TODO: implement props
  List<Object?> get props => [
        userId,
        total,
        note,
        transactionType,
        productType,
        meta,
        invoiceNumber,
        updatedAt,
        createdAt,
        id,
        bookingData,
      ];
}

class Meta extends Equatable {
  Meta({
    this.productType,
    this.productName,
    this.destination,
  });

  final String? productType;
  final String? productName;
  final String? destination;

  Meta copyWith({
    String? productType,
    String? productName,
    String? destination,
  }) =>
      Meta(
        productType: productType ?? this.productType,
        productName: productName ?? this.productName,
        destination: destination ?? this.destination,
      );

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        productType: json["product_type"] ?? null,
        productName: json["product_name"] ?? null,
        destination: json["destination"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "product_type": productType ?? null,
        "product_name": productName ?? null,
        "destination": destination ?? null,
      };

  @override
  // TODO: implement props
  List<Object?> get props => [
        productType,
        productName,
        destination,
      ];
}
