import 'package:gamepass/domain/home_page_content.dart';
import 'package:gamepass/infra/game/game_model.dart';
import 'package:gamepass/infra/game_collection/game_collection_model.dart';
import 'package:gamepass/infra/home_page_content/dto/home_page_content_repository_dto.dart';
import 'package:gamepass/infra/spotlight_collection/spotlight_collection_model.dart';

class HomePageContentModel {
  static HomePageContent fromRepository(HomePageContentRepositoryDTO data) {
    return HomePageContent(
      games: data.games.map((game) => GameModel.fromRepository(game)).toList(),
      spotlights: SpotlightCollectionModel.fromRepository(data.spotlights),
      gameCollections: data.collections
          .map((e) => GameCollectionModel.fromRepository(e))
          .toList(),
    );
  }
}
