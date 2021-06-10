import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final IconData iconName;
  final VoidCallback onIconPressed;

  const AppBarWidget(
      {Key? key, required this.iconName, required this.onIconPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      color: Color(0xff131313),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Image.asset(
                'assets/images/gamepass-logo.png',
                fit: BoxFit.contain,
              ),
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

  Brightness get brightness => Brightness.dark;
}
