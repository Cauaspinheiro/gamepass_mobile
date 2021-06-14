import 'package:flutter/material.dart';
import 'package:gamepass_clone/domain/game/game_list.dart';

class GamesListWidget extends StatelessWidget {
  final double? initialPadding;
  final GameList gameList;

  const GamesListWidget({
    Key? key,
    this.initialPadding,
    required this.gameList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final itemWidth = MediaQuery.of(context).size.width / 2.5;
    final itemHeight = itemWidth * 1.5;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            bottom: 8.0,
            left: this.initialPadding ?? 0,
          ),
          child: Text(
            this.gameList.title.toUpperCase(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          height: itemHeight,
          child: ListView.builder(
            padding: EdgeInsets.only(
              left: this.initialPadding ?? 0,
              right: this.initialPadding != null ? this.initialPadding! - 6 : 0,
            ),
            itemCount: gameList.games.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final game = gameList.games[index];

              return Container(
                margin: EdgeInsets.only(right: 8),
                width: itemWidth,
                color: Colors.black45,
                child: Image.network(game.imageUrl),
              );
            },
          ),
        ),
      ],
    );
  }
}
