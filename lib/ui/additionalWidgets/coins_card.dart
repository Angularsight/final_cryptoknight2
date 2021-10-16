import 'package:final_cryptoknight/ui/detailsPage.dart';
import 'package:final_cryptoknight/ui/hero/hero_animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CoinsCard extends StatefulWidget {
  final String coinTitle;
  final int index;
  const CoinsCard({Key? key, required this.index,required this.coinTitle}) : super(key: key);

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
