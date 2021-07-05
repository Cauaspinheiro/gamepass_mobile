import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gamepass/UI/theme/images.dart';
import 'package:gamepass/ui/theme/colors.dart';

class HomeAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 14),
        color: ThemeColors.background.withOpacity(.60),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 2),
          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 200,
                  child: Image.asset(ThemeImages.logo),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(70);
}
