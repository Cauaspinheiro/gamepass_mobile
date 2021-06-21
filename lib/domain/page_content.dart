import 'package:gamepass_clone/domain/game.dart';
import 'package:gamepass_clone/domain/games_list.dart';

class PageContent {
  String id;
  String title;
  Game spotlight;
  List<GamesList> gamesLists;

  PageContent({
    required this.id,
    required this.title,
    required this.spotlight,
    required this.gamesLists,
  });
}
