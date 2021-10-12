import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';



class WazirxHomePage extends StatefulWidget {
  const WazirxHomePage({Key? key}) : super(key: key);

  @override
  _WazirxHomePageState createState() => _WazirxHomePageState();
}

class _WazirxHomePageState extends State<WazirxHomePage> {
  @override
  Widget build(BuildContext context) {
    final appBarGradient = LinearGradient(colors: [Color(0xff1F5F74),Color(0xff000000)],stops: [0.3,1]);

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: appBarGradient,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)
            )
          ),
        ),
      ),

    );
  }
}
