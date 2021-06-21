import 'dart:convert';

import 'package:gamepass_clone/infra/game/game_repository_dto.dart';

class GamesListRepositoryDTO {
  String id;
  String title;
  List<GameRepositoryDTO> games;

  GamesListRepositoryDTO({
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

  factory GamesListRepositoryDTO.fromMap(Map<String, dynamic> map) {
    return GamesListRepositoryDTO(
      id: map['id'],
      title: map['title'],
      games: List<GameRepositoryDTO>.from(
        map['games'].map((x) => GameRepositoryDTO.fromMap(x)),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory GamesListRepositoryDTO.fromJson(String source) =>
      GamesListRepositoryDTO.fromMap(json.decode(source));
}
