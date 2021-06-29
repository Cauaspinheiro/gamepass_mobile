import 'package:gamepass_clone/domain/game.dart';
import 'package:gamepass_clone/domain/game_collection.dart';
import 'package:gamepass_clone/domain/spotlight_collection.dart';

class HomePageContent {
  List<GameCollection> gameCollections;
  SpotLightCollection spotlights;
  List<Game> games;

  HomePageContent({
    required this.games,
    required this.gameCollections,
    required this.spotlights,
  });
}
