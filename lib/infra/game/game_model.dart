import 'dart:convert';

import 'package:gamepass_clone/domain/game/game.dart';

class GameModel {
  Game game;

  GameModel(this.game);

  Map<String, dynamic> toMap() {
    return {
      'title': game.title,
      'publisher': game.publisher,
      'imageUrl': game.imageUrl,
    };
  }

  static Game fromMap(Map<String, dynamic> map) {
    return Game(
      title: map['title'],
      publisher: map['publisher'],
      imageUrl: map['image_url'],
    );
  }

  String toJson() => json.encode(toMap());

  static Game fromJson(String source) => fromMap(json.decode(source));
}
