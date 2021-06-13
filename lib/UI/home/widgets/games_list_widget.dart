import 'package:flutter/material.dart';

class GamesListWidget extends StatelessWidget {
  final double? initialPadding;
  final String title;

  const GamesListWidget({Key? key, this.initialPadding, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final itemWidth = MediaQuery.of(context).size.width / 2.4;
    final itemHeight = itemWidth * 1.5;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            bottom: 6.0,
            left: this.initialPadding ?? 0,
          ),
          child: Text(
            this.title.toUpperCase(),
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
            itemCount: 12,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(right: 6),
                width: itemWidth,
                color: Colors.black45,
              );
            },
          ),
        ),
      ],
    );
  }
}
