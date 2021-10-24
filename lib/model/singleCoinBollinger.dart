class SingleCoinBollinger {
  int? rank;
  String? coinSymbol;
  double? priceUsd;
  double? safety;
  double? trendDaily;
  double? trendShort;
  double? trendMid;
  double? trendLong;
  double? trendDistant;
  double? trendMean;
  double? rsi5min;
  double? rsi15min;
  double? rsi30min;
  double? rsi1h;
  double? rsi2h;
  double? atr5min;
  double? atr15min;
  double? atr30min;
  double? atr1h;
  double? atr2h;
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
  double? macdSignal5min;
  double? macd5min;
  double? macdSignal15min;
  double? macd15min;
  double? macdSignal30min;
  double? macd30min;
  double? macdSignal1h;
  double? macd1h;
  double? macdSignal2h;
  double? macd2h;

  SingleCoinBollinger(
      {this.rank,
        this.coinSymbol,
        this.priceUsd,
        this.safety,
        this.trendDaily,
        this.trendShort,
        this.trendMid,
        this.trendLong,
        this.trendDistant,
        this.trendMean,
        this.rsi5min,
        this.rsi15min,
        this.rsi30min,
        this.rsi1h,
        this.rsi2h,
        this.atr5min,
        this.atr15min,
        this.atr30min,
        this.atr1h,
        this.atr2h,
        this.bollingerBandsLower5min,
        this.bollingerBandsUpper5min,
        this.bollingerBandsLower15min,
        this.bollingerBandsUpper15min,
        this.bollingerBandsLower30min,
        this.bollingerBandsUpper30min,
        this.bollingerBandsLower1h,
        this.bollingerBandsUpper1h,
        this.bollingerBandsLower2h,
        this.bollingerBandsUpper2h,
        this.macdSignal5min,
        this.macd5min,
        this.macdSignal15min,
        this.macd15min,
        this.macdSignal30min,
        this.macd30min,
        this.macdSignal1h,
        this.macd1h,
        this.macdSignal2h,
        this.macd2h});

  SingleCoinBollinger.fromJson(Map<String, dynamic> json) {
    rank = json['rank'];
    coinSymbol = json['coin_symbol'];
    priceUsd = json['price_usd'];
    safety = json['safety'];
    trendDaily = json['trend_daily'];
    trendShort = json['trend_short'];
    trendMid = json['trend_mid'];
    trendLong = json['trend_long'];
    trendDistant = json['trend_distant'];
    trendMean = json['trend_mean'];
    rsi5min = json['rsi_5min'];
    rsi15min = json['rsi_15min'];
    rsi30min = json['rsi_30min'];
    rsi1h = json['rsi_1h'];
    rsi2h = json['rsi_2h'];
    atr5min = json['atr_5min'];
    atr15min = json['atr_15min'];
    atr30min = json['atr_30min'];
    atr1h = json['atr_1h'];
    atr2h = json['atr_2h'];
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
    macdSignal5min = json['macd_signal_5min'];
    macd5min = json['macd_5min'];
    macdSignal15min = json['macd_signal_15min'];
    macd15min = json['macd_15min'];
    macdSignal30min = json['macd_signal_30min'];
    macd30min = json['macd_30min'];
    macdSignal1h = json['macd_signal_1h'];
    macd1h = json['macd_1h'];
    macdSignal2h = json['macd_signal_2h'];
    macd2h = json['macd_2h'];
  }

  //
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['rank'] = this.rank;
  //   data['coin_symbol'] = this.coinSymbol;
  //   data['price_usd'] = this.priceUsd;
  //   data['safety'] = this.safety;
  //   data['trend_daily'] = this.trendDaily;
  //   data['trend_short'] = this.trendShort;
  //   data['trend_mid'] = this.trendMid;
  //   data['trend_long'] = this.trendLong;
  //   data['trend_distant'] = this.trendDistant;
  //   data['trend_mean'] = this.trendMean;
  //   data['rsi_5min'] = this.rsi5min;
  //   data['rsi_15min'] = this.rsi15min;
  //   data['rsi_30min'] = this.rsi30min;
  //   data['rsi_1h'] = this.rsi1h;
  //   data['rsi_2h'] = this.rsi2h;
  //   data['atr_5min'] = this.atr5min;
  //   data['atr_15min'] = this.atr15min;
  //   data['atr_30min'] = this.atr30min;
  //   data['atr_1h'] = this.atr1h;
  //   data['atr_2h'] = this.atr2h;
  //   data['bollinger_bands_lower_5min'] = this.bollingerBandsLower5min;
  //   data['bollinger_bands_upper_5min'] = this.bollingerBandsUpper5min;
  //   data['bollinger_bands_lower_15min'] = this.bollingerBandsLower15min;
  //   data['bollinger_bands_upper_15min'] = this.bollingerBandsUpper15min;
  //   data['bollinger_bands_lower_30min'] = this.bollingerBandsLower30min;
  //   data['bollinger_bands_upper_30min'] = this.bollingerBandsUpper30min;
  //   data['bollinger_bands_lower_1h'] = this.bollingerBandsLower1h;
  //   data['bollinger_bands_upper_1h'] = this.bollingerBandsUpper1h;
  //   data['bollinger_bands_lower_2h'] = this.bollingerBandsLower2h;
  //   data['bollinger_bands_upper_2h'] = this.bollingerBandsUpper2h;
  //   data['macd_signal_5min'] = this.macdSignal5min;
  //   data['macd_5min'] = this.macd5min;
  //   data['macd_signal_15min'] = this.macdSignal15min;
  //   data['macd_15min'] = this.macd15min;
  //   data['macd_signal_30min'] = this.macdSignal30min;
  //   data['macd_30min'] = this.macd30min;
  //   data['macd_signal_1h'] = this.macdSignal1h;
  //   data['macd_1h'] = this.macd1h;
  //   data['macd_signal_2h'] = this.macdSignal2h;
  //   data['macd_2h'] = this.macd2h;
  //   return data;
  // }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rank'] = this.rank;
    data['coin_symbol'] = this.coinSymbol;
    data['price_usd'] = this.priceUsd;
    data['safety'] = this.safety;
    data['trend_daily'] = this.trendDaily;
    data['trend_short'] = this.trendShort;
    data['trend_mid'] = this.trendMid;
    data['trend_long'] = this.trendLong;
    data['trend_distant'] = this.trendDistant;
    data['trend_mean'] = this.trendMean;
    data['rsi_5min'] = this.rsi5min;
    data['rsi_15min'] = this.rsi15min;
    data['rsi_30min'] = this.rsi30min;
    data['rsi_1h'] = this.rsi1h;
    data['rsi_2h'] = this.rsi2h;
    data['atr_5min'] = this.atr5min;
    data['atr_15min'] = this.atr15min;
    data['atr_30min'] = this.atr30min;
    data['atr_1h'] = this.atr1h;
    data['atr_2h'] = this.atr2h;
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
    data['macd_signal_5min'] = this.macdSignal5min;
    data['macd_5min'] = this.macd5min;
    data['macd_signal_15min'] = this.macdSignal15min;
    data['macd_15min'] = this.macd15min;
    data['macd_signal_30min'] = this.macdSignal30min;
    data['macd_30min'] = this.macd30min;
    data['macd_signal_1h'] = this.macdSignal1h;
    data['macd_1h'] = this.macd1h;
    data['macd_signal_2h'] = this.macdSignal2h;
    data['macd_2h'] = this.macd2h;
    return data;
  }
}
