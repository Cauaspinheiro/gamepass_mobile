import 'package:flutter/material.dart';

import 'package:gamepass_clone/domain/game.dart';
import 'package:gamepass_clone/ui/theme/colors.dart';
import 'package:gamepass_clone/ui/theme/fonts.dart';

class GamePage extends StatelessWidget {
  final Game game;

  const GamePage({
    Key? key,
    required this.game,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: ThemeColors.background,
        child: ListView(
          padding: EdgeInsets.only(bottom: 16),
          children: [
            Container(
              height: (MediaQuery.of(context).size.height ~/ 1.8).toDouble(),
              width: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                  image: NetworkImage(game.logo),
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.transparent, ThemeColors.background],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                padding: EdgeInsets.symmetric(vertical: 28, horizontal: 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(40),
                        ),
                        color: Colors.black26,
                      ),
                      child: BackButton(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0, left: 14, right: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(game.title, style: ThemeFonts.gameTitle),
                  SizedBox(height: 4),
                  Text(game.publisher, style: ThemeFonts.gamePublisher),
                  SizedBox(height: 16),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.network(game.rating.logo, width: 24, height: 24),
                      SizedBox(width: 6),
                      Text(
                        game.ratingReasons.join(', '),
                        style: ThemeFonts.gameRatingReasons,
                      )
                    ],
                  ),
                  SizedBox(height: 16),
                  Text('Tamanho', style: ThemeFonts.primaryTitle),
                  SizedBox(height: 4),
                  Text(game.size, style: ThemeFonts.primaryContent),
                  SizedBox(height: 16),
                  Text('Descrição', style: ThemeFonts.primaryTitle),
                  SizedBox(height: 4),
                  Text(game.description, style: ThemeFonts.primaryContent),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
