import 'dart:convert';

import 'package:gamepass_clone/infra/spotlight/dto/spotlight_repository_dto.dart';

class SpotlightCollectionRepositoryDTO {
  List<SpotlightRepositoryDTO> games;
  String id;
  String title;

  SpotlightCollectionRepositoryDTO({
    required this.id,
    required this.title,
    required this.games,
  });

  Map<String, dynamic> toMap() {
    return {
      'games': games.map((x) => x.toMap()).toList(),
      'id': id,
      'title': title,
    };
  }

  factory SpotlightCollectionRepositoryDTO.fromMap(Map<String, dynamic> map) {
    return SpotlightCollectionRepositoryDTO(
      games: List<SpotlightRepositoryDTO>.from(
        map['games']?.map((x) => SpotlightRepositoryDTO.fromMap(x)),
      ),
      id: map['id'],
      title: map['title'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SpotlightCollectionRepositoryDTO.fromJson(String source) =>
      SpotlightCollectionRepositoryDTO.fromMap(json.decode(source));
}
