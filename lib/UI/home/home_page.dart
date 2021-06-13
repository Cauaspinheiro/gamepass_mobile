import 'package:flutter/material.dart';
import 'package:gamepass_clone/UI/home/widgets/games_list_widget.dart';
import 'package:gamepass_clone/UI/shared/widgets/app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        iconName: Icons.search,
        onIconPressed: () {},
      ),
      body: Container(
        height: double.maxFinite,
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(0.0, -0.70),
            radius: 1,
            focal: Alignment.topCenter,
            colors: [
              Color(0xff018647),
              Color(0xff131313),
            ],
          ),
        ),
        child: ListView(
          padding: EdgeInsets.only(top: 16),
          children: [
            GamesListWidget(
              title: 'ADICIONADOS',
              initialPadding: 12,
            ),
            SizedBox(height: 15),
            GamesListWidget(
              title: 'MAIS POPULARES',
              initialPadding: 12,
            ),
            SizedBox(height: 14),
            GamesListWidget(
              title: 'AÇÃO',
              initialPadding: 12,
            ),
          ],
        ),
      ),
    );
  }
}
