import 'dart:convert';

import 'package:gamepass_clone/domain/game/game.dart';
import 'package:gamepass_clone/domain/game/game_list.dart';
import 'package:gamepass_clone/infra/game/game_model.dart';

class GameListModel {
  GameList gameList;

  GameListModel(this.gameList);

  Map<String, dynamic> toMap() {
    return {
      'games': gameList.games.map((game) => GameModel(game).toMap()).toList(),
      'title': gameList.title,
    };
  }

  static GameList fromMap(Map<String, dynamic> map) {
    return GameList(
      games: List<Game>.from(
        map['games'].map((game) => GameModel.fromMap(game)),
      ),
      title: map['title'],
    );
  }

  String toJson() => json.encode(toMap());

  static GameList fromJson(String source) => fromMap(json.decode(source));
}
