import 'package:gamepass/domain/game_collection.dart';
import 'package:gamepass/infra/game/game_model.dart';
import 'package:gamepass/infra/game_collection/dto/game_collection_repository_dto.dart';

class GameCollectionModel {
  static GameCollection fromRepository(GameCollectionRepositoryDTO data) {
    return new GameCollection(
      games: data.games.map((e) => GameModel.fromRepository(e)).toList(),
      title: data.title,
      id: data.id,
    );
  }
}
