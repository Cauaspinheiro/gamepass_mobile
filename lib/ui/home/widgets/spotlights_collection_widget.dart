import 'package:flutter/material.dart';
import 'package:gamepass_clone/domain/spotlight_collection.dart';

import 'game_item_widget.dart';

class SpotlightCollectionWidget extends StatelessWidget {
  final SpotLightCollection spotlightCollection;

  const SpotlightCollectionWidget({
    Key? key,
    required this.spotlightCollection,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final itemWidth = MediaQuery.of(context).size.width / 1.15;
    final itemHeight = itemWidth / 1.4;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: itemHeight,
          child: ListView.builder(
            padding: EdgeInsets.only(
              left: 14,
              right: 2,
            ),
            itemCount: spotlightCollection.games.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final game = spotlightCollection.games[index];

              return GameItemWidget(
                itemWidth: itemWidth,
                game: game,
                itemHeight: itemHeight,
                margin: EdgeInsets.only(
                  bottom: 6,
                  right: 12,
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
