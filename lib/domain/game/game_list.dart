import 'package:gamepass_clone/domain/game/game.dart';

class GameList {
  List<Game> games;
  String title;

  GameList({
    required this.games,
    required this.title,
  });
}
