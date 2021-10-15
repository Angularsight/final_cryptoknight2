import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

class HeroWidget extends StatelessWidget {
  final String tag;
  final Widget child;
  const HeroWidget({Key? key,required this.tag,required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(tag: 'Search', child: child);
  }
}
