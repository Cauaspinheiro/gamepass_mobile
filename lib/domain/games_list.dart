import 'package:gamepass_clone/domain/game.dart';

class GamesList {
  List<Game> games;
  String title;
  String id;

  GamesList({
    required this.games,
    required this.title,
    required this.id,
  });
}
