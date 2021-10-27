import 'dart:convert';

import 'package:final_cryptoknight/model/singleCoinBollinger.dart';
import 'package:final_cryptoknight/network/bollingerApiCall.dart';
import 'package:final_cryptoknight/network/singleCoinBollingerApiCall.dart';
import 'package:final_cryptoknight/provider/coinDataProvider.dart';
import 'package:final_cryptoknight/ui/homePage.dart';
import 'package:final_cryptoknight/ui/testingPage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';
import 'model/allCoinsBollinger.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedBottomNavItem = 0;

  //API CALL

  AllCoinsBollingerSuper? allCoinsBollinger;
  SingleCoinBollinger? singleCoinBollinger;
  var screens = [
    WazirxHomePage(),
    TestingPage(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // fetchData();

    final coinProvider = Provider.of<CoinDataProvider>(context,listen: false);
    coinProvider.fetchData().whenComplete(() {
      setState(() {});
    });
  }

  Future fetchData() async {
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
    setState(() {
      var data1 = json.decode(results[0].body);
      var data2 = json.decode(results[1].body);

      singleCoinBollinger = SingleCoinBollinger.fromJson(data1);
      allCoinsBollinger = AllCoinsBollingerSuper.fromJson(data2);

      for (int i=0;i<allCoinsBollinger!.items!.length;i++){
        print(allCoinsBollinger!.items![i].bollingerBandsUpper15min);
      }
      print('******************************************');
      print("${singleCoinBollinger!.priceUsd},${singleCoinBollinger!.coinSymbol}");
    });


  }

  @override
  Widget build(BuildContext context) {


    final bottomNavGradient =
        LinearGradient(colors: [Color(0xff020404), Color(0xff1F5F74)]);

    //Provider part
    // final coinProvider = Provider.of<CoinDataProvider>(context,listen: false);
    // coinProvider.fetchData().whenComplete(() {
    //   setState(() {});
    // });
    // var coinData = coinProvider.allCoinsBollinger;
    // print(coinData.items![0].coinSymbol);
    // for (int i=0;i<allCoinsBollinger!.items!.length;i++){
    //   print(allCoinsBollinger!.items![i].bollingerBandsUpper15min);
    // }


    return Scaffold(
      body: screens[_selectedBottomNavItem],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(gradient: bottomNavGradient),
        child: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              _selectedBottomNavItem = index;
            });
          },
          currentIndex: _selectedBottomNavItem,
          selectedItemColor: Colors.yellow,
          unselectedItemColor: Colors.grey,

          backgroundColor: Colors.transparent,
          // type: BottomNavigationBarType.fixed,
          elevation: 0,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Ionicons.ios_home), label: "Home"),
            BottomNavigationBarItem(
                label: "Testing",
                icon: Icon(MaterialCommunityIcons.bulletin_board))
          ],
        ),
      ),
    );
  }
}
