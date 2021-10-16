import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'dart:ui' as ui;

import 'package:google_fonts/google_fonts.dart';

import 'hero/hero_animation.dart';

class DetailsPage extends StatefulWidget {
  final String coinName;
  final int index;
  const DetailsPage({Key? key,required this.coinName,required this.index}) : super(key: key);

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
            padding: const EdgeInsets.only(top: 220, left: 20),
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.75,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(50)),
                  gradient: innerGradient),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 145.0, left: 70),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Hero(
                  tag: "tag${widget.index}",
                  child: Row(
                    children: [
                      Material(
                        type: MaterialType.transparency,
                        child: Text(
                          widget.coinName,
                          style: GoogleFonts.roboto(
                              fontSize: 36, color: Color(0xffA6A6A6)),
                        ),
                      ),
                      Material(
                        type: MaterialType.transparency,
                        child: Text("/INR",
                            textAlign: TextAlign.end,
                            style: GoogleFonts.roboto(
                                fontSize: 18, color: Color(0xffA6A6A6))),
                      ),
                    ],
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: CircleAvatar(
                      radius: 70,
                      backgroundColor: Colors.white,
                      child: ClipOval(
                        child: CircleAvatar(
                          radius: 45,
                          backgroundColor: Colors.lightBlue,
                          child: Image.network(
                            "https://wazirx.com/static/media/wazirx-logo-rounded.9bff9f42.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Container(
              width: double.infinity,
              child: CustomPaint(
                size: Size(500,
                    2000), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                painter: RPSCustomPainter(),
                child: Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height.toDouble() * 0.4),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          buildRow("Bolinger Top", "Sp"),
                          buildRow("Bolinger Bottom", "Bp"),
                          buildRow("Current Price", "Cur"),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 80.0),
                        child: Text("Time to sell now!",
                            style: GoogleFonts.k2d(
                                fontWeight: FontWeight.bold,
                                fontSize: 40,
                                color: Colors.white)),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildRow(String title, String value) {
    return title != "Current Price"
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "$title : ",
                  style: GoogleFonts.k2d(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      color: Colors.white),
                ),
                Material(
                  type: MaterialType.transparency,
                  child: Text("$value",
                      style: GoogleFonts.k2d(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                          color: Colors.white)),
                )
              ],
            ),
          )
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: DottedBorder(
              dashPattern: [10, 10],
              strokeWidth: 2,
              color: Colors.grey.shade600,
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  // border: Border.all(
                  //     width: 2,
                  //     color: Colors.grey.shade600,
                  //     style: BorderStyle.solid)
                ),
                child: Text("$title : $value",
                    style: GoogleFonts.k2d(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                        color: Colors.yellow)),
              ),
            ),
          );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;
    paint_0.shader = ui.Gradient.linear(
        Offset(size.width * 0.50, size.height * 0.01),
        Offset(size.width * 0.99, size.height * 0.99),
        [Color(0xff02648E), Color(0xff03090C)],
        [0.00, 1.00]);

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.0, size.height * 0.0128571);
    path_0.lineTo(size.width * 0.0, size.height * 1.5);
    path_0.lineTo(size.width * 1.5, size.height * 1.5);
    path_0.quadraticBezierTo(size.width * 0.9920833, size.height * 0.5685714,
        size.width * 1.1, size.height * 0.3);
    path_0.quadraticBezierTo(size.width * 0.0237500, size.height * 0.4903571,
        size.width * 0.0075000, size.height * 0.0128571);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
