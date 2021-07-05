import 'package:gamepass/infra/game/dto/game_repository_dto.dart';
import 'package:gamepass/infra/game_collection/dto/game_collection_repository_dto.dart';
import 'package:gamepass/infra/spotlight_collection/dto/spotlight_collection_repository_dto.dart';

class HomePageContentRepositoryDTO {
  List<GameRepositoryDTO> games;
  List<GameCollectionRepositoryDTO> collections;
  SpotlightCollectionRepositoryDTO spotlights;

  HomePageContentRepositoryDTO({
    required this.games,
    required this.collections,
    required this.spotlights,
  });

  Map<String, dynamic> toMap() {
    return {
      'games': games.map((x) => x.toMap()).toList(),
      'collections': collections.map((x) => x.toMap()).toList(),
      'spotlights': spotlights.toMap(),
    };
  }

  factory HomePageContentRepositoryDTO.fromMap(Map<String, dynamic> map) {
    return HomePageContentRepositoryDTO(
      games: List<GameRepositoryDTO>.from(
        map['games']?.map((x) => GameRepositoryDTO.fromMap(x)),
      ),
      collections: List<GameCollectionRepositoryDTO>.from(
        map['game_collections']
            ?.map((x) => GameCollectionRepositoryDTO.fromMap(x)),
      ),
      spotlights: SpotlightCollectionRepositoryDTO.fromMap(map['spotlights']),
    );
  }
}
