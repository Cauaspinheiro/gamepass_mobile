import 'dart:convert';

import 'package:gamepass_clone/infra/game/dto/game_repository_dto.dart';

class GameCollectionRepositoryDTO {
  String id;
  String title;
  List<GameRepositoryDTO> games;

  GameCollectionRepositoryDTO({
    required this.id,
    required this.title,
    required this.games,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'games': games.map((x) => x.toMap()).toList(),
    };
  }

  factory GameCollectionRepositoryDTO.fromMap(Map<String, dynamic> map) {
    return GameCollectionRepositoryDTO(
      id: map['id'],
      title: map['title'],
      games: List<GameRepositoryDTO>.from(
        map['games'].map((x) => GameRepositoryDTO.fromMap(x)),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory GameCollectionRepositoryDTO.fromJson(String source) =>
      GameCollectionRepositoryDTO.fromMap(json.decode(source));
}
