// To parse this JSON data, do
//
//     final createTransactionModel = createTransactionModelFromJson(jsonString);

// ignore_for_file: unnecessary_null_in_if_null_operators

import 'dart:convert';

import 'package:equatable/equatable.dart';

CreateTransactionModel createTransactionModelFromJson(String str) =>
    CreateTransactionModel.fromJson(json.decode(str));

String createTransactionModelToJson(CreateTransactionModel data) =>
    json.encode(data.toJson());

class CreateTransactionModel extends Equatable {
  const CreateTransactionModel({
    this.userId,
    this.total,
    this.note,
    this.transactionType,
    this.productType,
    this.producTypeId,
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
  final int? producTypeId;
  final String? productType;
  final MetaModel? meta;
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
    int? producTypeId,
    MetaModel? meta,
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
        producTypeId: producTypeId ?? this.producTypeId,
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
        meta: json["meta"] == null ? null : MetaModel.fromJson(json["meta"]),
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
  List<Object?> get props => [
        userId,
        total,
        note,
        transactionType,
        productType,
        producTypeId,
        meta,
        invoiceNumber,
        updatedAt,
        createdAt,
        id,
        bookingData,
      ];
}

class Meta extends Equatable {
  const Meta({
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
  List<Object?> get props => [
        productType,
        productName,
        destination,
      ];
}

TransactionListModel transactionListModelFromJson(String str) =>
    TransactionListModel.fromJson(json.decode(str));

String transactionListModelToJson(TransactionListModel data) =>
    json.encode(data.toJson());

class TransactionListModel {
  TransactionListModel({
    this.status,
    this.message,
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
  });

  final bool? status;
  final String? message;
  final int? currentPage;
  final List<DataModel>? data;
  final String? firstPageUrl;
  final int? from;
  final dynamic nextPageUrl;
  final String? path;
  final String? perPage;
  final dynamic prevPageUrl;
  final int? to;

  factory TransactionListModel.fromJson(Map<String, dynamic> json) =>
      TransactionListModel(
        status: json["status"] ?? null,
        message: json["message"] ?? null,
        currentPage: json["current_page"] ?? null,
        data: json["data"] == null
            ? null
            : List<DataModel>.from(
                json["data"].map((x) => DataModel.fromJson(x))),
        firstPageUrl: json["first_page_url"] ?? null,
        from: json["from"] ?? null,
        nextPageUrl: json["next_page_url"],
        path: json["path"] ?? null,
        perPage: json["per_page"] ?? null,
        prevPageUrl: json["prev_page_url"],
        to: json["to"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "status": status ?? null,
        "message": message ?? null,
        "current_page": currentPage ?? null,
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "first_page_url": firstPageUrl ?? null,
        "from": from ?? null,
        "next_page_url": nextPageUrl,
        "path": path ?? null,
        "per_page": perPage ?? null,
        "prev_page_url": prevPageUrl,
        "to": to ?? null,
      };
}

class DataModel {
  DataModel({
    this.id,
    this.parentId,
    this.invoiceNumber,
    this.userId,
    this.transactionType,
    this.total,
    this.transactionStatus,
    this.paymentStatus,
    this.confirmationStatus,
    this.createdAct,
    this.updatedAct,
    this.createdAt,
    this.updatedAt,
    this.payments,
    this.details,
  });

  final int? id;
  final dynamic parentId;
  final String? invoiceNumber;
  final int? userId;
  final String? transactionType;
  final String? total;
  final String? transactionStatus;
  final String? paymentStatus;
  final dynamic confirmationStatus;
  final dynamic createdAct;
  final dynamic updatedAct;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Payments? payments;
  final List<Detail>? details;

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        id: json["id"] ?? null,
        parentId: json["parent_id"],
        invoiceNumber: json["invoice_number"] ?? null,
        userId: json["user_id"] ?? null,
        transactionType: json["transaction_type"] ?? null,
        total: json["total"] ?? null,
        transactionStatus: json["transaction_status"] ?? null,
        paymentStatus: json["payment_status"] ?? null,
        confirmationStatus: json["confirmation_status"],
        createdAct: json["created_act"],
        updatedAct: json["updated_act"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        payments: json["payments"] == null
            ? null
            : Payments.fromJson(json["payments"]),
        details: json["details"] == null
            ? null
            : List<Detail>.from(json["details"].map((x) => Detail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? null,
        "parent_id": parentId,
        "invoice_number": invoiceNumber ?? null,
        "user_id": userId ?? null,
        "transaction_type": transactionType ?? null,
        "total": total ?? null,
        "transaction_status": transactionStatus ?? null,
        "payment_status": paymentStatus ?? null,
        "confirmation_status": confirmationStatus,
        "created_act": createdAct,
        "updated_act": updatedAct,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "payments": payments == null ? null : payments!.toJson(),
        "details": details == null
            ? null
            : List<dynamic>.from(details!.map((x) => x.toJson())),
      };
}

class Detail {
  Detail({
    this.id,
    this.transactionId,
    this.productTypeId,
    this.bookingId,
    this.meta,
    this.amount,
    this.note,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.bookingData,
    this.productType,
  });

  final int? id;
  final int? transactionId;
  final int? productTypeId;
  final dynamic? bookingId;
  final MetaModel? meta;
  final String? amount;
  final dynamic? note;
  final dynamic? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<dynamic>? bookingData;
  final String? productType;

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        id: json["id"] ?? null,
        transactionId: json["transaction_id"] ?? null,
        productTypeId: json["product_type_id"] ?? null,
        bookingId: json["booking_id"],
        meta: json["meta"] == null ? null : MetaModel.fromJson(json["meta"]),
        amount: json["amount"] ?? null,
        note: json["note"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        bookingData: json["booking_data"] == null
            ? null
            : List<dynamic>.from(json["booking_data"].map((x) => x)),
        productType: json["product_type"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? null,
        "transaction_id": transactionId ?? null,
        "product_type_id": productTypeId ?? null,
        "booking_id": bookingId,
        "meta": meta == null ? null : meta!.toJson(),
        "amount": amount ?? null,
        "note": note,
        "status": status,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "booking_data": bookingData == null
            ? null
            : List<dynamic>.from(bookingData!.map((x) => x)),
        "product_type": productType ?? null,
      };
}

class MetaModel {
  MetaModel({
    this.productType,
    this.productName,
    this.destination,
  });

  final String? productType;
  final String? productName;
  final String? destination;

  factory MetaModel.fromJson(Map<String, dynamic> json) => MetaModel(
        productType: json["product_type"] ?? null,
        productName: json["product_name"] ?? null,
        destination: json["destination"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "product_type": productType ?? null,
        "product_name": productName ?? null,
        "destination": destination ?? null,
      };
}

class Payments {
  Payments({
    this.transactionId,
    this.vaNumber,
    this.paymentChannel,
  });

  final int? transactionId;
  final String? vaNumber;
  final String? paymentChannel;

  factory Payments.fromJson(Map<String, dynamic> json) => Payments(
        transactionId: json["transaction_id"] ?? null,
        vaNumber: json["va_number"] ?? null,
        paymentChannel: json["payment_channel"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "transaction_id": transactionId ?? null,
        "va_number": vaNumber ?? null,
        "payment_channel": paymentChannel ?? null,
      };
}
