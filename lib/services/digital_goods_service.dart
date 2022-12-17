import 'dart:convert';

import 'package:digital_goods/models/goods_model.dart';
import 'package:http/http.dart' as http;

class DigitalGoodsService {
  String baseUrl = 'https://api-gowisata.aturtoko.site/api';

  Future<DigitalGoodsModel> fetchDigitalGoods(String token) async {
    var url = "$baseUrl/digital-goods";
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };

    print(headers);

    var response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    print(jsonDecode(response.body));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      DigitalGoodsModel digitalGoodsData = DigitalGoodsModel.fromJson(data);

      print(digitalGoodsData);

      return digitalGoodsData;
    } else {
      throw Exception("Gagal Fetch Digital Goods");
    }
  }
}
