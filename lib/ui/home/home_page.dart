import 'package:flutter/material.dart';
import 'package:gamepass_clone/app/use-cases/get_home_page_content.dart';
import 'package:gamepass_clone/domain/game_collection.dart';
import 'package:gamepass_clone/domain/home_page_content.dart';
import 'package:gamepass_clone/ui/home/widgets/game_collection_widget.dart';
import 'package:gamepass_clone/ui/home/widgets/game_item_widget.dart';
import 'package:gamepass_clone/ui/home/widgets/home_app_bar_widget.dart';
import 'package:gamepass_clone/ui/home/widgets/spotlights_collection_widget.dart';
import 'package:gamepass_clone/ui/theme/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var loading = true;
  late HomePageContent pageContent;

  @override
  void initState() {
    getGames();

    super.initState();
  }

  void getGames() async {
    final newPageContent = await GetHomePageContentUseCase().handle();

    setState(() {
      pageContent = newPageContent;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  ThemeColors.background,
                  ThemeColors.primary.withOpacity(.75),
                ],
                begin: FractionalOffset(0.5, .45),
                end: Alignment(0.5, 1.6),
                stops: [0, 1],
              ),
            ),
            child: loading ? _buildLoading() : _buildHome(),
          ),
          Positioned(
            top: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: HomeAppBarWidget(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoading() {
    return Center(
      child: CircularProgressIndicator(color: ThemeColors.content),
    );
  }

  Widget _buildHome() {
    return ListView(
      padding: EdgeInsets.only(top: 112, bottom: 16),
      children: [
        SpotlightCollectionWidget(
          spotlightCollection: pageContent.spotlights,
        ),
        SizedBox(height: 20),
        ..._buildGameCollections(),
        SizedBox(height: 16),
        GameCollectionWidget(
          gameCollection: GameCollection(
            games: pageContent.games,
            id: '12',
            title: 'todos os jogos',
          ),
        )
      ],
    );
  }

  List<Widget> _buildGameCollections() {
    var listIndex = 0;
    List<Widget> result = [];

    for (var i = 0; i < pageContent.gameCollections.length * 2 - 1; i++) {
      if (i.isEven) {
        result.add(
          GameCollectionWidget(
            gameCollection: pageContent.gameCollections[listIndex],
          ),
        );
        listIndex++;
      } else {
        result.add(SizedBox(height: 16));
      }
    }

    return result;
  }
}
