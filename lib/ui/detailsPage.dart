import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'dart:ui' as ui;

import 'package:google_fonts/google_fonts.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    final innerGradient = LinearGradient(
        colors: [Color(0xff02648E), Color(0xff03090C).withOpacity(0)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter);
    final WIDTH = 200.0;
    return Scaffold(
      backgroundColor: Color(0xff053742),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 200),
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.75,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(50)),
                  gradient: innerGradient),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 150.0),
            child: Row(
              children: [
                Text("WRX",
                    style: GoogleFonts.roboto(
                        fontSize: 36, color: Color(0xffA6A6A6))),
                Row(
                  children: [
                    Text("/INR",
                        style: GoogleFonts.roboto(
                            fontSize: 18, color: Color(0xffA6A6A6))),
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.lightBlue,
                        child: Icon(MaterialCommunityIcons.bitcoin),
                      ),
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 200),
            child: Container(
              width: double.infinity,
              child: CustomPaint(
                size: Size(500,300), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                painter: RPSCustomPainter(),
              ),
            ),
          )
        ],
      ),
    );
  }
}


class RPSCustomPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {



    Paint paint_0 = new Paint()
      ..color = Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;
    paint_0.shader = ui.Gradient.linear(Offset(size.width*0.50,size.height*0.01),Offset(size.width*0.99,size.height*0.99),[Color(0xff006c85),Color(0xff00222d)],[0.00,1.00]);

    Path path_0 = Path();
    path_0.moveTo(size.width*0.0075000,size.height*0.0128571);
    path_0.lineTo(size.width*0.0075000,size.height*0.9871429);
    path_0.lineTo(size.width*0.9908333,size.height*0.9885714);
    path_0.quadraticBezierTo(size.width*0.9920833,size.height*0.5685714,size.width*0.9925000,size.height*0.4285714);
    path_0.quadraticBezierTo(size.width*0.0237500,size.height*0.4903571,size.width*0.0075000,size.height*0.0128571);
    path_0.close();

    canvas.drawPath(path_0, paint_0);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}





