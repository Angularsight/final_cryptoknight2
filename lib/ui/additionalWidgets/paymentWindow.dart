import 'package:final_cryptoknight/ui/additionalWidgets/buy_or_sell_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentWindow extends StatefulWidget {
  const PaymentWindow({Key? key}) : super(key: key);

  @override
  State<PaymentWindow> createState() => _PaymentWindowState();
}

class _PaymentWindowState extends State<PaymentWindow>
    with SingleTickerProviderStateMixin {
  int _selectedNavItem = 0;
  bool _isBuySelected = true;
  late TabController tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 10, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.45,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(colors: [
            Color(0xffFFFCFC).withOpacity(0.24),
            Colors.white.withOpacity(0.06)
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: (){
                  setState(() {
                    _isBuySelected = true;
                  });
                },
                child: Container(
                  height: 55,
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: BoxDecoration(
                      color: _isBuySelected?Colors.green.withOpacity(0.5):Colors.black38.withOpacity(0.3),
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(20))),
                  child: Center(
                    child: Text(
                      "Buy",
                      style: GoogleFonts.k2d(fontSize: 28, color: _isBuySelected?Colors.white:Colors.green.withOpacity(0.3)),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  setState(() {
                    _isBuySelected = false;
                  });
                },
                child: Container(
                  height: 55,
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: BoxDecoration(
                      color: !_isBuySelected?Colors.red.withOpacity(0.5):Colors.black38.withOpacity(0.3),
                      borderRadius:
                          BorderRadius.only(topRight: Radius.circular(20))),
                  child: Center(
                    child: Text(
                      "Sell",
                      style: GoogleFonts.k2d(fontSize: 28, color: !_isBuySelected?Colors.white:Colors.redAccent.withOpacity(0.3)),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Divider(
            height: 4,
            thickness: 3,
            color: Colors.grey,
          ),
          BuyOrSellCard(
            isBuySelected: _isBuySelected,
          )
        ],
      ),
    );
  }
}
