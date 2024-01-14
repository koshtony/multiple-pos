import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pos/models.dart';

Future<List<Stocks>> getStocks() async {
  var headers = {
    'Authorization': 'Token 608f77f12e643d37816eaf9d7d6b074d174da8ab',
    'Access-Control-Allow-Origin': 'true'
  };
  var dio = Dio();
  var response = await dio.request(
    'http://127.0.0.1:8000/pos_api/pos/list/',
    options: Options(
      method: 'GET',
      headers: headers,
    ),
  );

  var responseInfo = response.data;

  List<Stocks> stocks = [];

  for (var val in responseInfo['results']) {
    Stocks stock = Stocks(
      serial: val["serial"],
      name: val["name"],
      qty: val["qty"],
      price: 0.0,
      cost: 0.0,
      image: val["image"],
    );
    stocks.add(stock);
  }

  return stocks;
}
