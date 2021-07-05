import 'package:flutter/material.dart';
import 'package:gamepass/ui/theme/colors.dart';

class PlayerControlButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;

  final Color backgroundColor, foregroundColor;

  const PlayerControlButton.primary({
    Key? key,
    required this.onTap,
    required this.icon,
  })  : backgroundColor = ThemeColors.primary,
        foregroundColor = Colors.black,
        super(key: key);

  const PlayerControlButton.secondary({
    Key? key,
    required this.onTap,
    required this.icon,
  })  : backgroundColor = Colors.black,
        foregroundColor = ThemeColors.primary,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(44)),
      ),
      width: 40,
      height: 40,
      child: IconButton(
        iconSize: 24,
        onPressed: onTap,
        icon: Icon(icon, color: foregroundColor),
      ),
    );
  }
}
