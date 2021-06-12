import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final IconData iconName;
  final VoidCallback onIconPressed;

  const AppBarWidget(
      {Key? key, required this.iconName, required this.onIconPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
    ));

    return Container(
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      decoration: BoxDecoration(
        color: Color(0xff131313),
        boxShadow: [
          BoxShadow(
            blurRadius: 8,
            offset: Offset(0, 4),
            color: Color.fromRGBO(0, 0, 0, .4),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(top: 12, bottom: 12),
              child: Image.asset('assets/images/gamepass-logo.png'),
            ),
            IconButton(
              onPressed: onIconPressed,
              iconSize: 24,
              splashRadius: 20,
              icon: Icon(
                this.iconName,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => new AppBar().preferredSize;
}
