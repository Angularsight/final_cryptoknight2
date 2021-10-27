import 'dart:convert';
import 'package:final_cryptoknight/model/allCoinsBollinger.dart';
import 'package:http/http.dart';

class BollingerApiCall {

  Future<AllCoinsBollinger> getAllBollinger() async{
    int rankFrom = 1;
    int rankTo = 1000;
    var url = 'https://quantifycrypto.com/api/v1.0-beta/bollinger-band?rank_from=$rankFrom&rank_to=$rankTo';
    Response response = await get(Uri.parse(url),headers: {
      'Qc-Access-Key-Id':'LV78651ERHBXMEDSM3VU',
      'Qc-Secret-Key':'W2A/+OgeUA+kN9lcKNciCutwaFrfG9lHEzpy+ZU6xAk='
    });

    if(response.statusCode==200){
      print(response.body);
      return AllCoinsBollinger.fromJson(jsonDecode(response.body));
    }else{
      throw Exception('Error in networking block');
    }
  }

}