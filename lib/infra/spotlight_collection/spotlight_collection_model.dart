import 'package:gamepass_clone/domain/spotlight_collection.dart';
import 'package:gamepass_clone/infra/spotlight/spotlight_model.dart';
import 'package:gamepass_clone/infra/spotlight_collection/dto/spotlight_collection_repository_dto.dart';

class SpotlightCollectionModel {
  static SpotLightCollection fromRepository(
      SpotlightCollectionRepositoryDTO data) {
    return SpotLightCollection(
      games: data.games.map((e) => SpotlightModel.fromRepository(e)).toList(),
      title: data.title,
      id: data.id,
    );
  }
}
