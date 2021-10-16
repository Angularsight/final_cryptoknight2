import 'package:final_cryptoknight/ui/detailsPage.dart';
import 'package:final_cryptoknight/ui/hero/hero_animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FavouriteCard extends StatefulWidget {
  final String coinTitle;
  final int index;
  const FavouriteCard({Key? key, required this.index,required this.coinTitle}) : super(key: key);

  @override
  _FavouriteCardState createState() => _FavouriteCardState();
}

class _FavouriteCardState extends State<FavouriteCard> {
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
                        curve: Interval(0, 1, curve: Curves.easeInExpo));

                    return FadeTransition(
                      opacity: curve,
                      child: DetailsPage(coinName: widget.coinTitle,index: widget.index,),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Hero(
                      tag: 'Hero${widget.index}',
                      child: Text(
                        widget.coinTitle,
                        style: GoogleFonts.roboto(
                            fontSize: 36, color: Color(0xffA6A6A6)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: Text("/INR",
                          textAlign: TextAlign.end,
                          style: GoogleFonts.roboto(
                              fontSize: 18, color: Color(0xffA6A6A6))),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40, top: 5),
                child: Text("Rs. CUR",
                    style: GoogleFonts.roboto(
                        fontSize: 24,
                        fontWeight: FontWeight.w300,
                        color: Color(0xffA6A6A6))),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildInkButtons("BP", Color(0xff89C26E)),
                    buildInkButtons('SP', Color(0xffEB6262))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  InkWell buildInkButtons(String title, Color color) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: 80,
        height: 22,
        decoration:
        BoxDecoration(color: color, borderRadius: BorderRadius.circular(6)),
        child: Center(
            child: Text(
              '$title',
              style: GoogleFonts.roboto(
                  fontSize: 12, fontWeight: FontWeight.normal, color: Colors.white),
            )),
      ),
    );
  }
}
