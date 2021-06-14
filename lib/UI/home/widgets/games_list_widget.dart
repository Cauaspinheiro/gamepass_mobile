import 'package:flutter/material.dart';
import 'package:gamepass_clone/UI/shared/utils/resize_api_image.dart';
import 'package:gamepass_clone/domain/game/game_list.dart';

class GamesListWidget extends StatelessWidget {
  final GameList gameList;

  const GamesListWidget({
    Key? key,
    required this.gameList,
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
            this.gameList.title.toUpperCase(),
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
            itemCount: gameList.games.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final game = gameList.games[index];

              return Container(
                margin: EdgeInsets.only(bottom: 8, right: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(6.0)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black87,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      )
                    ]),
                width: itemWidth,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(6.0)),
                  child: Image.network(
                    resizeApiImage(
                      imageUrl: game.imageUrl,
                      width: itemWidth,
                      height: itemHeight,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
