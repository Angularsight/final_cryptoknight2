import 'package:final_cryptoknight/ui/additionalWidgets/testing2.dart';
import 'package:flutter/material.dart';

import '../detailsPage.dart';

class Testing extends StatefulWidget {
  const Testing({Key? key}) : super(key: key);

  @override
  _TestingState createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(
            tag: "Hero",
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                child: Text("WRX"),
                onTap: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                      transitionDuration: Duration(milliseconds: 1500),
                  reverseTransitionDuration: Duration(milliseconds: 500),
                  pageBuilder: (context, animation, secondaryAnimation) {
                  final curve = CurvedAnimation(
                  parent: animation,
                  curve: Interval(0, 1, curve: Curves.easeIn));

                  return FadeTransition(
                  opacity: curve,
                  child: Testing2(),
                  );
                  }));
                },
              ),
            )),
      ),
    );
  }
}
