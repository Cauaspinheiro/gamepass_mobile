import 'package:flutter/material.dart';
import 'package:gamepass_clone/domain/game_collection.dart';

import 'game_item_widget.dart';

class GameCollectionWidget extends StatelessWidget {
  final GameCollection gameCollection;

  const GameCollectionWidget({
    Key? key,
    required this.gameCollection,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final itemWidth = MediaQuery.of(context).size.width / 2.6;
    final itemHeight = itemWidth * 1.6;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 8, left: 12),
          child: Text(
            this.gameCollection.title.toUpperCase(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          height: itemHeight,
          child: ListView.builder(
            padding: EdgeInsets.only(
              left: 12,
              right: 6,
            ),
            itemCount: gameCollection.games.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final game = gameCollection.games[index];

              return GameItemWidget(
                itemWidth: itemWidth,
                game: game,
                itemHeight: itemHeight,
                margin: EdgeInsets.only(bottom: 8, right: 8),
              );
            },
          ),
        )
      ],
    );
  }
}
