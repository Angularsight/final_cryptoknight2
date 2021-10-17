import 'package:final_cryptoknight/ui/detailsPage.dart';
import 'package:final_cryptoknight/ui/hero/hero_animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CoinsCard extends StatefulWidget {
  final String coinTitle;
  final String coinPrice;
  final int index;
  const CoinsCard({Key? key, required this.index,required this.coinTitle,required this.coinPrice}) : super(key: key);

  @override
  _CoinsCardState createState() => _CoinsCardState();
}

class _CoinsCardState extends State<CoinsCard> {
  @override
  Widget build(BuildContext context) {
    final cardGradient = LinearGradient(colors: [
      Color(0xffFFFCFC).withOpacity(0.24),
      Color(0xffFFFFFF).withOpacity(0.06)
    ], begin: Alignment.topLeft, end: Alignment.bottomRight);
    return Padding(
      padding: const EdgeInsets.only(left: 12.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              PageRouteBuilder(
                  transitionDuration: Duration(milliseconds: 500),
                  reverseTransitionDuration: Duration(milliseconds: 500),
                  pageBuilder: (context, animation, secondaryAnimation) {
                    final curve = CurvedAnimation(
                        parent: animation,
                        curve: Interval(0, 0.5, curve: Curves.easeInExpo));

                    return FadeTransition(
                      opacity: curve,
                      child: DetailsPage(coinName: widget.coinTitle,index:widget.index,coinPrice:widget.coinPrice),
                    );
                  }));
          // Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsPage()));
        },
        child: Container(
          width: 200,
          height: 160,
          decoration: BoxDecoration(
              gradient: cardGradient,
              borderRadius: BorderRadius.all(Radius.circular(25))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Hero(
                  tag: 'tag${widget.index}',
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Material(
                        type: MaterialType.transparency,
                        child: Text(
                          widget.coinTitle,
                          style: GoogleFonts.roboto(
                              fontSize: 36, color: Color(0xffA6A6A6)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: Material(
                          type: MaterialType.transparency,
                          child: Text("/INR",
                              textAlign: TextAlign.end,
                              style: GoogleFonts.roboto(
                                  fontSize: 18, color: Color(0xffA6A6A6))),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Hero(
                tag: 'currentPrice${widget.index}',
                child: Container(
                  width: 180,
                  height: 40,
                  child: Center(
                    child: Material(
                      type: MaterialType.transparency,
                      child: Text("Rs. ${widget.coinPrice}",
                          style: GoogleFonts.roboto(
                              fontSize: 24,
                              fontWeight: FontWeight.w300,
                              color: Color(0xffA6A6A6))),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildInkButtons("${widget.coinTitle}BP", Color(0xff89C26E)),
                    buildInkButtons('${widget.coinTitle}SP', Color(0xffEB6262))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInkButtons(String title, Color color) {

    return Container(
      width: 80,
      height: 22,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(6)),
      child: Center(
          child: Hero(
            tag: title == "${widget.coinTitle}SP" ? "sp${widget.index}" : "bp${widget.index}",
            child: Material(
              type: MaterialType.transparency,
              child: Text(
        '$title',
        style: GoogleFonts.roboto(
                fontSize: 12, fontWeight: FontWeight.normal, color: Colors.white),
      ),
            ),
          )),
    );
  }
}
