import 'package:gamepass_clone/domain/game.dart';
import 'package:gamepass_clone/domain/rating.dart';

class Spotlight extends Game {
  String spotlightTitle;
  String spotlightDescription;
  String spotlightCover;

  Spotlight({
    required this.spotlightCover,
    required this.spotlightDescription,
    required this.spotlightTitle,
    required String id,
    required String trailer,
    required String description,
    required String logo,
    required String publisher,
    required Rating rating,
    required List<String> ratingReasons,
    required String size,
    required String title,
  }) : super(
          id: id,
          trailer: trailer,
          description: description,
          logo: logo,
          publisher: publisher,
          rating: rating,
          ratingReasons: ratingReasons,
          size: size,
          title: title,
        );
}
