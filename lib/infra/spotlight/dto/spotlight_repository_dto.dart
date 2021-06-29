import 'dart:convert';

import 'package:gamepass_clone/infra/game/dto/game_repository_dto.dart';
import 'package:gamepass_clone/infra/rating/dto/rating_repository_dto.dart';

class SpotlightRepositoryDTO extends GameRepositoryDTO {
  String spotlight_title;
  String spotlight_cover;
  String spotlight_description;

  SpotlightRepositoryDTO({
    required this.spotlight_title,
    required this.spotlight_cover,
    required this.spotlight_description,
    required String id,
    required String description,
    required String logo,
    required String publisher,
    required RatingRepositoryDTO rating,
    required List<String> rating_reasons,
    required String size,
    required String title,
    required String trailer,
  }) : super(
          id: id,
          description: description,
          logo: logo,
          publisher: publisher,
          rating: rating,
          rating_reasons: rating_reasons,
          size: size,
          title: title,
          trailer: trailer,
        );

  @override
  Map<String, dynamic> toMap() {
    final gameMap = super.toMap();

    return {
      ...gameMap,
      'spotlight_title': spotlight_title,
      'spotlight_cover': spotlight_cover,
      'spotlight_description': spotlight_description,
    };
  }

  @override
  factory SpotlightRepositoryDTO.fromMap(Map<String, dynamic> map) {
    final game = GameRepositoryDTO.fromMap(map);

    return SpotlightRepositoryDTO(
      spotlight_title: map['spotlight_title'],
      spotlight_cover: map['spotlight_cover'],
      spotlight_description: map['spotlight_description'],
      description: game.description,
      id: game.id,
      logo: game.logo,
      publisher: game.publisher,
      rating: game.rating,
      rating_reasons: game.rating_reasons,
      size: game.size,
      title: game.title,
      trailer: game.trailer,
    );
  }

  @override
  String toJson() => json.encode(toMap());

  @override
  factory SpotlightRepositoryDTO.fromJson(String source) =>
      SpotlightRepositoryDTO.fromMap(json.decode(source));
}
