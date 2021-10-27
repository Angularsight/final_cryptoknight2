


import 'dart:convert';

import 'package:final_cryptoknight/model/allCoinsBollinger.dart';
import 'package:final_cryptoknight/model/singleCoinBollinger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CoinDataProvider with ChangeNotifier{
  late SingleCoinBollinger singleCoinBollinger;
  late AllCoinsBollingerSuper allCoinsBollinger;
  final resultData = [];

  Future<dynamic> fetchData() async {


    final results = await Future.wait([
      http.get(Uri.parse("https://quantifycrypto.com/api/v1.0-beta/coin/BTC"),
          headers: {
            'Qc-Access-Key-Id': 'LV78651ERHBXMEDSM3VU',
            'Qc-Secret-Key': 'W2A/+OgeUA+kN9lcKNciCutwaFrfG9lHEzpy+ZU6xAk='
          }),
      http.get(
          Uri.parse(
              'https://quantifycrypto.com/api/v1.0-beta/bollinger-band?rank_from=1&rank_to=1000'),
          headers: {
            'Qc-Access-Key-Id': 'LV78651ERHBXMEDSM3VU',
            'Qc-Secret-Key': 'W2A/+OgeUA+kN9lcKNciCutwaFrfG9lHEzpy+ZU6xAk='
          })
    ]);
    var data1 = json.decode(results[0].body);
    var data2 = json.decode(results[1].body);

    singleCoinBollinger = SingleCoinBollinger.fromJson(data1);
    allCoinsBollinger = AllCoinsBollingerSuper.fromJson(data2);

    resultData.add(singleCoinBollinger);
    resultData.add(allCoinsBollinger);

    notifyListeners();

  }


}