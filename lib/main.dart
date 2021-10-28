import 'package:final_cryptoknight/provider/coinDataProvider.dart';
import 'package:final_cryptoknight/ui/testingPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'bottomNav.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MultiProvider(providers: [
      ChangeNotifierProvider(create: (_)=>CoinDataProvider())
    ],



    child: BottomNavBar(),
    )
  ));
}
