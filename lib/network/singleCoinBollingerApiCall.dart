import 'dart:convert';
import 'package:final_cryptoknight/model/allCoinsBollinger.dart';
import 'package:final_cryptoknight/model/singleCoinBollinger.dart';
import 'package:http/http.dart';

class SingleCoinBollingerData {

  Future<SingleCoinBollinger> singleCoinBollinger( String coinName ) async{
    var url = "https://quantifycrypto.com/api/v1.0-beta/coin/$coinName";
    Response response = await get(Uri.parse(url),headers: {
      'Qc-Access-Key-Id':'LV78651ERHBXMEDSM3VU',
      'Qc-Secret-Key':'W2A/+OgeUA+kN9lcKNciCutwaFrfG9lHEzpy+ZU6xAk='
    });

    if(response.statusCode==200){
      print(response.body);
      return SingleCoinBollinger.fromJson(jsonDecode(response.body));
    }else {
      throw Exception('Error in networking block');
    }
  }
}