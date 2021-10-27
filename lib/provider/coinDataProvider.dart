


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CoinDataProvider with ChangeNotifier{



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

    return results;

  }


}