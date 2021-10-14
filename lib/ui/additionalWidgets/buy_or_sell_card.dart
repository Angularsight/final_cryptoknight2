

import 'package:flutter/cupertino.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class BuyOrSellCard extends StatelessWidget {
  final bool isBuySelected;
  const BuyOrSellCard({Key? key,required this.isBuySelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isBuySelected) {
      return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25,horizontal: 10),
        child: Column(
          children: [
            buildInputAmountContainer(context,'At Price',"INR"),
            buildInputAmountContainer(context, "Amount", "WRX"),
            buildInputAmountContainer(context, "Total", "INR"),

            InkWell(
              onTap: (){},
              child: Container(
                height: 35,
                width: MediaQuery.of(context).size.width*0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.green
                ),
                child: Center(child: Text("Buy WRX",style: GoogleFonts.roboto(fontSize: 17 ,color: Colors.white,fontWeight: FontWeight.bold),),),
              ),
            )
          ],
        ),
      ),


    );
    } else {
      return Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25,horizontal: 10),
          child: Column(
            children: [
              buildInputAmountContainer(context,'At Price',"INR"),
              buildInputAmountContainer(context, "Amount", "WRX"),
              buildInputAmountContainer(context, "Total", "INR"),

              InkWell(
                onTap: (){},
                child: Container(
                  height: 35,
                  width: MediaQuery.of(context).size.width*0.9,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.redAccent
                  ),
                  child: Center(child: Text("Sell WRX",style: GoogleFonts.roboto(fontSize: 17 ,color: Colors.white,fontWeight: FontWeight.bold),),),
                ),
              )
            ],
          ),
        ),


      );
    }
  }

  Widget buildInputAmountContainer(BuildContext context,String title,String subtitle) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Container(
              height: 60,
              width: MediaQuery.of(context).size.width*0.9,
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(color: Color(0xff818181),width: 2)
              ),
                child: Row(
                  children: [
                    Container(
                      height: 55,
                      width: 75,

                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("$title",style: GoogleFonts.roboto(fontSize: 16,color: Color(0xffB6B6B6)),),
                            Text("$subtitle",style: GoogleFonts.roboto(fontSize: 16,fontWeight: FontWeight.bold,color: Color(0xffB6B6B6)),)
                          ],
                        ),
                      ),
                    ),
                    VerticalDivider(thickness: 3,color: Colors.grey,),
                    Container(
                      width: MediaQuery.of(context).size.width*0.8 - 75,
                      child: TextField(
                        cursorColor: Colors.grey,
                        showCursor: false,
                        keyboardType: TextInputType.numberWithOptions(decimal: true),
                        maxLines: 1,
                        style: GoogleFonts.roboto(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                          disabledBorder: InputBorder.none,
                          border: InputBorder.none,
                          focusColor: Colors.black,
                        ),
                      ),
                    )
                  ],
              )
            ),
    );
  }
}
