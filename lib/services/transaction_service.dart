// ignore_for_file: unnecessary_null_in_if_null_operators

import 'dart:convert';

import '/models/payment_method_model.dart';
import '/models/transaction_model.dart';

import 'package:http/http.dart' as http;

class TransactionService {
  String baseUrl = 'https://api-gowisata.aturtoko.site/api';

  Future<CreateTransactionModel> createTransaction(
      {required CreateTransactionModel createTransactionData,
      required String token}) async {
    var url = '$baseUrl/transaction/create';
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };
    var body = jsonEncode({
      "user_id": createTransactionData.userId,
      "total": createTransactionData.total,
      "note": createTransactionData.note ?? "test",
      "transaction_type": createTransactionData.transactionType,
      "product_type": createTransactionData.productType,
      "meta": {
        "product_type": createTransactionData.meta?.productType ?? null,
        "product_name": createTransactionData.meta?.productName ?? null,
        "destination": createTransactionData.meta?.destination ?? null
      }
    });

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      CreateTransactionModel createTransactionData =
          CreateTransactionModel.fromJson(data);

      return createTransactionData;
    } else {
      throw Exception("Gagal Create Transaction");
    }
  }

  Future<List<PaymentMethodModel>> fetchPaymentMethodList(
      {required String token}) async {
    try {
      var url = "$baseUrl/payment/method-list";
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': token,
      };

      var response = await http.get(
        Uri.parse(url),
        headers: headers,
      );

      if (response.statusCode == 200) {
        return List<PaymentMethodModel>.from(json
            .decode(response.body)['data']
            .map((x) => PaymentMethodModel.fromJson(x)));
      } else {
        throw Exception("Gagal Fetch Payment Method");
      }
    } catch (e) {
      rethrow;
    }
  }
}
