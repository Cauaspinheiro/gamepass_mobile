import 'package:flutter/material.dart';
import 'package:gamepass/domain/spotlight_collection.dart';
import 'package:gamepass/ui/home/widgets/spotlight_item_widget.dart';

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
              final spotlight = spotlightCollection.games[index];

              return SpotlightItemWidget(
                itemWidth: itemWidth,
                spotlight: spotlight,
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
