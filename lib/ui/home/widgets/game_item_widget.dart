import 'package:flutter/material.dart';
import 'package:gamepass_clone/UI/shared/utils/resize_api_image.dart';
import 'package:gamepass_clone/domain/game.dart';

class GameItemWidget extends StatelessWidget {
  const GameItemWidget({
    Key? key,
    required this.itemWidth,
    required this.game,
    required this.itemHeight,
    this.margin,
  }) : super(key: key);

  final double itemWidth;
  final Game game;
  final EdgeInsetsGeometry? margin;
  final double itemHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: this.margin,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(2.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 2,
              offset: Offset(0, 2),
            )
          ]),
      width: itemWidth,
      height: itemHeight + 4,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(2.0)),
        child: Image.network(
          resizeApiImage(
            imageUrl: game.logo,
            width: itemWidth,
            height: itemHeight,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
