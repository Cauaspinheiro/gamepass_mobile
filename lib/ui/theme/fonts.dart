import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gamepass_clone/ui/theme/colors.dart';

class ThemeFonts {
  static const collectionTitle = TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.bold,
    fontFamily: 'Ubuntu',
  );

  static const spotlightTitle = TextStyle(
    color: Colors.white,
    fontSize: 18,
    fontWeight: FontWeight.bold,
    fontFamily: 'Ubuntu',
  );

  static const spotlightDescription = TextStyle(
    color: ThemeColors.content,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    fontFamily: 'Roboto',
  );
}
