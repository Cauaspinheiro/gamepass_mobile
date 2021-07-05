import 'package:gamepass/domain/spotlight.dart';
import 'package:gamepass/infra/rating/rating_model.dart';
import 'package:gamepass/infra/spotlight/dto/spotlight_repository_dto.dart';

class SpotlightModel {
  static Spotlight fromRepository(SpotlightRepositoryDTO data) {
    return new Spotlight(
      description: data.description,
      id: data.id,
      logo: data.logo,
      publisher: data.publisher,
      rating: RatingModel.fromRepository(data.rating),
      ratingReasons: data.rating_reasons,
      spotlightCover: data.spotlight_cover,
      size: data.size,
      spotlightDescription: data.spotlight_description,
      spotlightTitle: data.spotlight_title,
      title: data.title,
      trailer: data.trailer,
    );
  }
}
