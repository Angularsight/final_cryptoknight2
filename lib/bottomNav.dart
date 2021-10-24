import 'package:final_cryptoknight/network/bollingerApiCall.dart';
import 'package:final_cryptoknight/ui/homePage.dart';
import 'package:final_cryptoknight/ui/testingPage.dart';
import 'package:flutter/material.dart';
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
  late Future<AllCoinsBollinger> allBollingerData;

  var screens = [
    WazirxHomePage(),
    TestingPage(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allBollingerData = BollingerApiCall().getAllBollinger();
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
