import 'dart:convert';

import 'package:digital_goods/models/goods_model.dart';
import 'package:http/http.dart' as http;

class DigitalGoodsService {
  String baseUrl = 'https://api-gowisata.aturtoko.site/api';

  Future<DigitalGoodsModel> fetchDigitalGoods({required String token}) async {
    try {
      var url = "$baseUrl/digital-goods";
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': token,
      };

      var response = await http.get(
        Uri.parse(url),
        headers: headers,
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        DigitalGoodsModel digitalGoodsData = DigitalGoodsModel.fromJson(data);

        return digitalGoodsData;
      } else {
        throw Exception("Gagal Fetch Digital Goods");
      }
    } catch (e) {
      rethrow;
    }
  }
}
