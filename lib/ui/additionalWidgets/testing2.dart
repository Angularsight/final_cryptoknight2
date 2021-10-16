import 'package:flutter/material.dart';

class Testing2 extends StatefulWidget {
  const Testing2({Key? key}) : super(key: key);

  @override
  _Testing2State createState() => _Testing2State();
}

class _Testing2State extends State<Testing2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
          tag: "Hero",
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Material(type: MaterialType.transparency,child: Text("WRX")),
          )),
    );
  }
}
