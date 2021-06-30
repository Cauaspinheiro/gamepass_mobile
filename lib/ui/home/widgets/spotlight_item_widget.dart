import 'dart:math';

import 'package:flutter/material.dart';

import 'package:gamepass_clone/domain/spotlight.dart';
import 'package:gamepass_clone/ui/theme/fonts.dart';

class SpotlightItemWidget extends StatelessWidget {
  final double itemWidth;
  final Spotlight spotlight;
  final EdgeInsetsGeometry? margin;
  final double itemHeight;

  const SpotlightItemWidget({
    Key? key,
    required this.itemWidth,
    required this.spotlight,
    this.margin,
    required this.itemHeight,
  }) : super(key: key);

  String _getDescription() {
    if (spotlight.spotlightDescription.length < 100) {
      return spotlight.spotlightDescription;
    }

    final cut = spotlight.spotlightDescription.substring(
      0,
      min(spotlight.spotlightDescription.length, 100),
    );

    final array = cut.trim().split(' ');

    array.removeLast();
    final result = array.join(' ');

    return '$result...';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: this.margin,
      width: itemWidth,
      height: itemHeight + 4,
      alignment: Alignment.bottomLeft,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(spotlight.spotlightCover),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.transparent, Colors.black],
            begin: Alignment.topCenter,
            end: Alignment(0, 0.9),
          ),
        ),
        width: itemWidth,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              spotlight.spotlightTitle.toUpperCase(),
              style: ThemeFonts.spotlightTitle,
            ),
            SizedBox(height: 4),
            Text(_getDescription(), style: ThemeFonts.spotlightDescription),
          ],
        ),
      ),
    );
  }
}
