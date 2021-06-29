import 'package:gamepass_clone/domain/game.dart';

class SpotLightCollection {
  List<Game> games;
  String title;
  String id;

  SpotLightCollection({
    required this.games,
    required this.title,
    required this.id,
  });
}
