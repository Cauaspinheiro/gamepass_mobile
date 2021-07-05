import 'package:gamepass/domain/rating.dart';
import 'package:gamepass/infra/rating/dto/rating_repository_dto.dart';

class RatingModel {
  static Rating fromRepository(RatingRepositoryDTO data) {
    return new Rating(
      id: data.id,
      age: data.age,
      logo: data.logo,
    );
  }
}
