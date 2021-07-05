import 'package:gamepass/domain/game.dart';
import 'package:gamepass/infra/game/dto/game_repository_dto.dart';
import 'package:gamepass/infra/rating/rating_model.dart';

class GameModel {
  static Game fromRepository(GameRepositoryDTO data) {
    return new Game(
      id: data.id,
      description: data.description,
      logo: data.logo,
      publisher: data.publisher,
      rating: RatingModel.fromRepository(data.rating),
      ratingReasons: data.rating_reasons,
      size: data.size,
      title: data.title,
      trailer: data.trailer,
    );
  }
}
