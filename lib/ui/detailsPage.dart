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
    final WIDTH = double.infinity;
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
          Row(
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
          Container(
            child: CustomPaint(
              size: Size(WIDTH,(WIDTH*1.0).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
              painter: RPSCustomPainter(),
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
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;


    Path path_0 = Path();
    path_0.moveTo(size.width*0.0050000,size.height*0.0050000);
    path_0.lineTo(size.width*0.0037500,size.height*0.8700000);
    path_0.lineTo(size.width*0.4937500,size.height*0.8687500);
    path_0.quadraticBezierTo(size.width*0.4928125,size.height*0.4665625,size.width*0.4925000,size.height*0.3325000);
    path_0.quadraticBezierTo(size.width*0.0506250,size.height*0.3518750,size.width*0.0050000,size.height*0.0050000);
    path_0.close();

    canvas.drawPath(path_0, paint_0);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}
