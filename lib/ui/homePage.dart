import 'package:final_cryptoknight/model/singleCoinBollinger.dart';
import 'package:final_cryptoknight/provider/coinDataProvider.dart';
import 'package:final_cryptoknight/ui/additionalWidgets/coins_card2.dart';
import 'package:final_cryptoknight/ui/detailsPage.dart';
import 'package:final_cryptoknight/ui/detailsPage2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dart:ui' as ui;
import 'additionalWidgets/coins_card.dart';
import 'additionalWidgets/favourite_coins_card.dart';

class WazirxHomePage extends StatefulWidget {
  WazirxHomePage({Key? key}) : super(key: key);

  @override
  _WazirxHomePageState createState() => _WazirxHomePageState();
}

class _WazirxHomePageState extends State<WazirxHomePage> {
  var coinList = ["WRX", "BTC", "ETH", 'DOGE', 'BZRX', 'CHR', 'HPR'];
  var currentPrice = [
    '101.5',
    '47,61,529',
    '3,01,371.8',
    '18.651',
    '25.01',
    '28.0400',
    '28.55'
  ];
  var coinListFav = ["WRX", "BTC", "ETH", 'DOGE', 'BZRX', 'CHR', 'HPR'];
  var currentPriceFav = [
    '101.5',
    '47,61,529',
    '3,01,371.8',
    '18.651',
    '25.01',
    '28.0400',
    '28.55'
  ];
  int _selectedListWheelItem = 0;
  late ScrollController _scrollController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    final coinData = Provider.of<CoinDataProvider>(context);
    var coinDataBody = coinData.allCoinsBollinger;

    final appBarGradient = LinearGradient(
        colors: [Color(0xff000000), Color(0xff1F5F74)], stops: [0.3, 1]);
    final titleGradient = LinearGradient(colors: [
      Color(0xffC3C3C3).withOpacity(0.71),
      Color(0xffECECEC).withOpacity(0.31)
    ], begin: Alignment.topLeft, end: Alignment.bottomRight);
    final titleReverse = LinearGradient(colors: [
      Color(0xffECECEC).withOpacity(0.31),
      Color(0xffC3C3C3).withOpacity(0.71)
    ], begin: Alignment.centerLeft, end: Alignment.centerRight);

    return Scaffold(
      backgroundColor: Color(0xff053742),
      appBar: AppBar(
        backgroundColor: Color(0xff053742),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: appBarGradient,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10))),
        ),
        title: Padding(
          padding:
              EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.25),
          child: Row(
            children: [
              ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return titleGradient.createShader(bounds);
                  },
                  child: Text(
                    "Cryptoknight ",
                    style: GoogleFonts.k2d(
                        fontWeight: FontWeight.bold, fontSize: 28),
                  )),
              ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return titleReverse.createShader(bounds);
                  },
                  child: Icon(
                    MaterialCommunityIcons.bitcoin,
                    size: 28,
                  ))
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(),
                child: CustomPaint(
                  size: Size(double.infinity,
                      400), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                  painter: RPSCustomPainter(),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 50, 20, 10),
                    child: CarouselSlider.builder(
                        slideIndicator: CircularSlideIndicator(
                            currentIndicatorColor: Colors.yellow,
                            indicatorBackgroundColor: Colors.grey),
                        slideBuilder: (context) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      " Ivella yenu illa munde kodthini nodu nakkan",
                                      style: GoogleFonts.k2d(
                                          color: Color(0xffA6A6A6),
                                          fontSize: 25,
                                          shadows: [
                                            Shadow(
                                                color: Colors.black38,
                                                offset: Offset(1, 4),
                                                blurRadius: 5)
                                          ]),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "-Vishnu Pranav R",
                                    style: GoogleFonts.k2d(
                                        color: Color(0xffA6A6A6),
                                        fontSize: 25,
                                        shadows: [
                                          Shadow(
                                              color: Colors.black38,
                                              offset: Offset(1, 4),
                                              blurRadius: 5)
                                        ]),
                                    textAlign: TextAlign.end,
                                  ),
                                ],
                              )
                            ],
                          );
                        },
                        itemCount: 2),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 50, 0, 15),
                child: Text(
                  "Coins",
                  textAlign: TextAlign.start,
                  style: GoogleFonts.k2d(
                      fontWeight: FontWeight.bold,
                      fontSize: 48,
                      color: Color(0xffD7D7D7)),
                ),
              ),
              Container(
                width: double.infinity,
                height: 180,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return CoinsCard2(
                        index: index,
                        // coinTitle: coinList[index],
                        // coinPrice: currentPrice[index],
                      );
                    },
                    separatorBuilder: (context, int) => SizedBox(
                          width: 25,
                        ),
                    itemCount: coinDataBody.items!.length),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25.0, left: 25, bottom: 10),
                child: Text(
                  "Favourites",
                  textAlign: TextAlign.start,
                  style: GoogleFonts.k2d(
                      fontWeight: FontWeight.bold,
                      fontSize: 48,
                      color: Color(0xffD7D7D7)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 220,
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context, PageRouteBuilder(pageBuilder:
                              (context, animation, secondaryAnimation) {
                            return DetailsPageF(
                                coinName: coinListFav[_selectedListWheelItem],
                                index: _selectedListWheelItem,
                                coinPrice:
                                    currentPriceFav[_selectedListWheelItem]);
                          }));
                        },
                        child: ListWheelScrollView.useDelegate(
                          onSelectedItemChanged: (index) {
                            setState(() {
                              _selectedListWheelItem = index;
                            });
                          },
                          squeeze: 1,
                          physics: FixedExtentScrollPhysics(),
                          itemExtent: 220,
                          childDelegate: ListWheelChildBuilderDelegate(
                              childCount: 10,
                              builder: (builder, index) {
                                if (index <= coinListFav.length - 1) {
                                  return RotatedBox(
                                    quarterTurns: 1,
                                    child: FavouriteCard(
                                      index: index,
                                      coinTitle: coinListFav[index], coinPrice: currentPriceFav[index],
                                    ),
                                  );
                                }
                              }),
                        ),
                      ),
                    )),
              )
            ],
          ),
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
        Offset(size.width * 0.48, size.height * -0.31),
        Offset(size.width * 0.48, size.height * 1.31),
        [Color(0xff02648E), Color(0xff060101)],
        [0.00, 1.00]);

    Path path_0 = Path();
    path_0.moveTo(size.width * -0.4082250, size.height * -0.3067571);
    path_0.lineTo(size.width * 1.3765583, size.height * -0.3040571);
    path_0.quadraticBezierTo(size.width * 1.0598833, size.height * 1.3034000,
        size.width * 0.5186917, size.height * 1.3037714);
    path_0.quadraticBezierTo(size.width * -0.0288000, size.height * 1.3070571,
        size.width * -0.4082250, size.height * -0.3067571);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
