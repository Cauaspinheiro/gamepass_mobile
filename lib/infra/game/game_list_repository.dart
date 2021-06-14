import 'package:flutter/services.dart';
import 'package:gamepass_clone/domain/game/game_list.dart';
import 'package:gamepass_clone/infra/game/game_list_model.dart';

class GameListRepository {
  static Future<GameList> getHomeGames() async {
    final response = await rootBundle.loadString("assets/data/new-games.json");

    return GameListModel.fromJson(response);
  }
}
