import 'package:gamepass_clone/domain/game.dart';

class GameCollection {
  List<Game> games;
  String title;
  String id;

  GameCollection({
    required this.games,
    required this.title,
    required this.id,
  });
}
