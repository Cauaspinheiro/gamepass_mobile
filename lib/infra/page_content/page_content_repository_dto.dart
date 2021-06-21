import 'dart:convert';

import 'package:gamepass_clone/infra/game/game_repository_dto.dart';
import 'package:gamepass_clone/infra/games_list/games_list_repository_dto.dart';

class PageContentRepositoryDTO {
  String id;
  String title;
  GameRepositoryDTO spotlight;
  List<GamesListRepositoryDTO> games_lists;

  PageContentRepositoryDTO({
    required this.id,
    required this.title,
    required this.spotlight,
    required this.games_lists,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'spotlight': spotlight.toMap(),
      'games_lists': games_lists.map((x) => x.toMap()).toList(),
    };
  }

  factory PageContentRepositoryDTO.fromMap(Map<String, dynamic> map) {
    return PageContentRepositoryDTO(
      id: map['id'],
      title: map['title'],
      spotlight: GameRepositoryDTO.fromMap(map['spotlight']),
      games_lists: List<GamesListRepositoryDTO>.from(
          map['games_lists'].map((x) => GamesListRepositoryDTO.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory PageContentRepositoryDTO.fromJson(String source) =>
      PageContentRepositoryDTO.fromMap(json.decode(source));
}
