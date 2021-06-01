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
      color: Colors.black87,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            IconButton(
              onPressed: onIconPressed,
              iconSize: 28,
              splashRadius: 24,
              icon: Icon(
                this.iconName,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => new AppBar().preferredSize;
}
