import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:google_fonts/google_fonts.dart';

import 'additionalWidgets/paymentWindow.dart';

class TestingPage extends StatefulWidget {
  const TestingPage({Key? key}) : super(key: key);

  @override
  _TestingPageState createState() => _TestingPageState();
}

class _TestingPageState extends State<TestingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff053742),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 90, vertical: 50),
                child: DottedBorder(
                  dashPattern: [10, 10],
                  strokeWidth: 2,
                  color: Colors.grey.shade600,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 05),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      // border: Border.all(
                      //     width: 2,
                      //     color: Colors.grey.shade600,
                      //     style: BorderStyle.solid)
                    ),
                    child: Text("Testing",
                        style: GoogleFonts.k2d(
                            fontWeight: FontWeight.normal,
                            fontSize: 28,
                            color: Colors.yellow)),
                  ),
                ),
              ),
              Text(
                "Disclaimer",
                style: GoogleFonts.k2d(
                    fontStyle: FontStyle.italic,
                    fontSize: 28,
                    color: Colors.white),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: Text(
                    "These are fake coins used for only testing purposes and do not hold any real value. So should only be used to see the trends of coins",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.k2d(
                        fontStyle: FontStyle.italic,
                        fontSize: 18,
                        color: Colors.white),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 30, 10, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Fake Coins:",
                          style: GoogleFonts.k2d(
                              fontSize: 24,
                              fontWeight: FontWeight.w300,
                              color: Color(0xff44CAF4)),
                        ),
                        Container(
                            width: 95,
                            height: 36,
                            child: TextField(
                              decoration: InputDecoration(
                                  hintText: "WRX/INR",
                                  hintStyle: TextStyle(fontSize: 18),
                                  suffixIcon:
                                      Icon(Icons.arrow_drop_down_outlined),
                                  filled: true,
                                  fillColor: Colors.grey.withOpacity(0.7),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(18),
                                      borderSide:
                                          BorderSide(style: BorderStyle.none))),
                            ))
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        "1000,000,000",
                        style: GoogleFonts.k2d(
                            fontWeight: FontWeight.w300,
                            fontSize: 36,
                            color: Color(0xff5CC138)),
                      ),
                    ),
                    buildRow("Low","3737415.0"),
                    buildRow("High","3737415.0"),
                    buildRow("Current","3737415.0"),

                  ],
                ),

              ),
              PaymentWindow()
            ],
          ),

        ));
  }

  Padding buildRow(String title,String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
                      children: [
                        Text(
                          "$title: ",
                          style: GoogleFonts.k2d(
                              fontWeight: FontWeight.w200,
                              fontSize: 26,
                              color: Colors.grey),
                        ),
                        Text(
                          "$value",
                          style: GoogleFonts.k2d(
                              fontWeight: FontWeight.w500,
                              fontSize: 28,
                              color: Colors.white),
                        ),


                      ],
                    ),
    );
  }
}
