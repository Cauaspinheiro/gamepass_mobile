import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gamepass/ui/theme/colors.dart';

class ThemeFonts {
  static const primaryTitle = TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.bold,
    fontFamily: 'Ubuntu',
  );

  static const primaryContent = TextStyle(
    color: ThemeColors.content,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    fontFamily: 'Roboto',
  );

  static const spotlightTitle = TextStyle(
    color: Colors.white,
    fontSize: 18,
    fontWeight: FontWeight.bold,
    fontFamily: 'Ubuntu',
  );

  static const gameTitle = TextStyle(
    color: Colors.white,
    fontSize: 24,
    fontWeight: FontWeight.bold,
    fontFamily: 'Ubuntu',
  );

  static const gamePublisher = TextStyle(
    color: ThemeColors.content,
    fontSize: 14,
    fontWeight: FontWeight.w300,
    fontFamily: 'Ubuntu',
  );

  static const gameRatingReasons = TextStyle(
    color: Color(0xff888888),
    fontSize: 12,
    fontWeight: FontWeight.w400,
    fontFamily: 'Ubuntu',
  );
}
