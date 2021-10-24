import 'dart:convert';

import 'package:final_cryptoknight/model/singleCoinBollinger.dart';
import 'package:final_cryptoknight/network/bollingerApiCall.dart';
import 'package:final_cryptoknight/network/singleCoinBollingerApiCall.dart';
import 'package:final_cryptoknight/ui/homePage.dart';
import 'package:final_cryptoknight/ui/testingPage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_icons/flutter_icons.dart';
import 'model/allCoinsBollinger.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedBottomNavItem = 0;

  //API CALL
  // late List <AllCoinsBollinger> allBollingerData;
  // late List <SingleCoinBollinger> singleCoinBollinger;
  late AllCoinsBollinger allCoinsBollinger;
  late SingleCoinBollinger singleCoinBollinger;
  var screens = [
    WazirxHomePage(),
    TestingPage(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
    // allBollingerData = BollingerApiCall().getAllBollinger();
    // singleCoinBollinger = SingleCoinBollingerData().singleCoinBollinger("BTC");
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
      // print(data1);
      // print(data2);

      allCoinsBollinger = AllCoinsBollinger.fromJson(data1);
      singleCoinBollinger = SingleCoinBollinger.fromJson(data2);
      // allBollingerData = data1.map((e) => AllCoinsBollinger.fromJson(e)).toList();
      // singleCoinBollinger = data2.map((e) => SingleCoinBollinger.fromJson(e)).toList();

      print(allCoinsBollinger);
      print(singleCoinBollinger);
    });


  }

  @override
  Widget build(BuildContext context) {
    final bottomNavGradient =
        LinearGradient(colors: [Color(0xff020404), Color(0xff1F5F74)]);
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
