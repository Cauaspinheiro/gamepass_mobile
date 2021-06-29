import 'package:flutter/material.dart';
import 'package:gamepass_clone/app/use-cases/get_home_page_content.dart';
import 'package:gamepass_clone/domain/home_page_content.dart';
import 'package:gamepass_clone/ui/home/widgets/game_collection_widget.dart';
import 'package:gamepass_clone/ui/home/widgets/home_app_bar_widget.dart';
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
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            ThemeColors.primary,
            ThemeColors.background,
          ],
          begin: Alignment.topCenter,
          end: Alignment(0, -.5),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: HomeAppBarWidget(),
        body: loading ? _buildLoading() : _buildHome(),
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
        SizedBox(height: 32),
        ..._buildGameCollections(),
      ],
    );
  }

  List<Widget> _buildGameCollections() {
    var listIndex = 0;
    List<Widget> result = [];

    for (var i = 0; i < pageContent.gameCollections.length * 2 - 1; i++) {
      if (i % 2 == 0) {
        result.add(
          GameCollectionWidget(
            gameCollection: pageContent.gameCollections[listIndex],
          ),
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
