
import 'package:flutter/cupertino.dart';

class AllCoinsBollingerSuper with ChangeNotifier{
  List<AllCoinsBollinger>? items;
  AllCoinsBollingerSuper({this.items});

  AllCoinsBollingerSuper.fromJson(List<dynamic> json){
    items = <AllCoinsBollinger>[];
    json.forEach((v)=> items!.add(new AllCoinsBollinger.fromJson(v)));
  }

  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data = new Map<String,dynamic>();
    if(this.items!=null){
      data['items'] = this.items!.map((e) => e.toJson()).toList();
    }
    return data;
  }
}




class AllCoinsBollinger {
  int? rank;
  String? coinSymbol;
  double? bollingerBandsLower5min;
  double? bollingerBandsUpper5min;
  double? bollingerBandsLower15min;
  double? bollingerBandsUpper15min;
  double? bollingerBandsLower30min;
  double? bollingerBandsUpper30min;
  double? bollingerBandsLower1h;
  double? bollingerBandsUpper1h;
  double? bollingerBandsLower2h;
  double? bollingerBandsUpper2h;

  AllCoinsBollinger(
      {this.rank,
        this.coinSymbol,
        this.bollingerBandsLower5min,
        this.bollingerBandsUpper5min,
        this.bollingerBandsLower15min,
        this.bollingerBandsUpper15min,
        this.bollingerBandsLower30min,
        this.bollingerBandsUpper30min,
        this.bollingerBandsLower1h,
        this.bollingerBandsUpper1h,
        this.bollingerBandsLower2h,
        this.bollingerBandsUpper2h});

  AllCoinsBollinger.fromJson(Map<String, dynamic> json) {
    rank = json['rank'];
    coinSymbol = json['coin_symbol'];
    bollingerBandsLower5min = json['bollinger_bands_lower_5min'];
    bollingerBandsUpper5min = json['bollinger_bands_upper_5min'];
    bollingerBandsLower15min = json['bollinger_bands_lower_15min'];
    bollingerBandsUpper15min = json['bollinger_bands_upper_15min'];
    bollingerBandsLower30min = json['bollinger_bands_lower_30min'];
    bollingerBandsUpper30min = json['bollinger_bands_upper_30min'];
    bollingerBandsLower1h = json['bollinger_bands_lower_1h'];
    bollingerBandsUpper1h = json['bollinger_bands_upper_1h'];
    bollingerBandsLower2h = json['bollinger_bands_lower_2h'];
    bollingerBandsUpper2h = json['bollinger_bands_upper_2h'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rank'] = this.rank;
    data['coin_symbol'] = this.coinSymbol;
    data['bollinger_bands_lower_5min'] = this.bollingerBandsLower5min;
    data['bollinger_bands_upper_5min'] = this.bollingerBandsUpper5min;
    data['bollinger_bands_lower_15min'] = this.bollingerBandsLower15min;
    data['bollinger_bands_upper_15min'] = this.bollingerBandsUpper15min;
    data['bollinger_bands_lower_30min'] = this.bollingerBandsLower30min;
    data['bollinger_bands_upper_30min'] = this.bollingerBandsUpper30min;
    data['bollinger_bands_lower_1h'] = this.bollingerBandsLower1h;
    data['bollinger_bands_upper_1h'] = this.bollingerBandsUpper1h;
    data['bollinger_bands_lower_2h'] = this.bollingerBandsLower2h;
    data['bollinger_bands_upper_2h'] = this.bollingerBandsUpper2h;
    return data;
  }
}
