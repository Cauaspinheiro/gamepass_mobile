import 'dart:convert';

import 'package:gamepass_clone/infra/rating/dto/rating_repository_dto.dart';

class GameRepositoryDTO {
  String id;
  String description;
  String logo;
  String publisher;
  RatingRepositoryDTO rating;
  List<String> rating_reasons;
  String size;
  String title;
  String trailer;

  GameRepositoryDTO({
    required this.id,
    required this.description,
    required this.logo,
    required this.publisher,
    required this.rating,
    required this.rating_reasons,
    required this.size,
    required this.title,
    required this.trailer,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'description': description,
      'logo': logo,
      'publisher': publisher,
      'rating': rating.toMap(),
      'rating_reasons': rating_reasons,
      'size': size,
      'title': title,
      'trailer': trailer,
    };
  }

  factory GameRepositoryDTO.fromMap(Map<String, dynamic> map) {
    return GameRepositoryDTO(
      id: map['id'],
      description: map['description'],
      logo: map['logo'],
      publisher: map['publisher'],
      rating: RatingRepositoryDTO.fromMap(map['rating']),
      rating_reasons: List<String>.from(map['rating_reasons']),
      size: map['size'],
      title: map['title'],
      trailer: map['trailer'],
    );
  }

  String toJson() => json.encode(toMap());

  factory GameRepositoryDTO.fromJson(String source) =>
      GameRepositoryDTO.fromMap(json.decode(source));
}
