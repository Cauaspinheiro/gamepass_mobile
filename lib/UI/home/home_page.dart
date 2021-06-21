import 'package:flutter/material.dart';
import 'package:gamepass_clone/UI/home/widgets/game_item_widget.dart';
import 'package:gamepass_clone/UI/home/widgets/games_list_widget.dart';
import 'package:gamepass_clone/UI/shared/widgets/app_bar.dart';
import 'package:gamepass_clone/app/page_content_use_case.dart';
import 'package:gamepass_clone/domain/page_content.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool loading = true;
  late PageContent pageContent;

  @override
  void initState() {
    getGames();

    super.initState();
  }

  void getGames() async {
    final newPageContent = await PageContentUseCase().findByTitle('home');

    setState(() {
      pageContent = newPageContent;
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
        Column(
          children: [
            GameItemWidget(
              itemWidth: MediaQuery.of(context).size.width - 32,
              game: pageContent.spotlight,
              itemHeight: (MediaQuery.of(context).size.width - 32) * 1.2,
            ),
          ],
        ),
        SizedBox(height: 32),
        ..._buildGamesLists(),
      ],
    );
  }

  List<Widget> _buildGamesLists() {
    var listIndex = 0;
    List<Widget> result = [];

    for (var i = 0; i < pageContent.gamesLists.length * 2 - 1; i++) {
      if (i % 2 == 0) {
        result.add(
          GamesListWidget(gameList: pageContent.gamesLists[listIndex]),
        );
        listIndex++;
        continue;
      }

      result.add(SizedBox(
        height: 16,
      ));
    }

    return result;
  }
}
