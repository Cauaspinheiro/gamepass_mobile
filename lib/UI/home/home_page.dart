import 'package:flutter/material.dart';
import 'package:gamepass_clone/UI/home/widgets/games_list_widget.dart';
import 'package:gamepass_clone/UI/shared/widgets/app_bar.dart';
import 'package:gamepass_clone/domain/game/game_list.dart';
import 'package:gamepass_clone/infra/game/game_list_repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool loading = true;
  GameList? gameList;

  @override
  void initState() {
    getGames();

    super.initState();
  }

  void getGames() async {
    final games = await GameListRepository.getHomeGames();

    setState(() {
      gameList = games;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        iconName: Icons.search,
        onIconPressed: () {},
      ),
      body: Container(
        width: double.maxFinite,
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
        child: loading ? _buildLoading() : _buildHome(),
      ),
    );
  }

  Widget _buildLoading() {
    return Center(
      child: CircularProgressIndicator(color: Colors.white54),
    );
  }

  Widget _buildHome() {
    return ListView(
      padding: EdgeInsets.symmetric(vertical: 16),
      children: [
        GamesListWidget(
          initialPadding: 12,
          gameList: gameList!,
        ),
      ],
    );
  }
}
