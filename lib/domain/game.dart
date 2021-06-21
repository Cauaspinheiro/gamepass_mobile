import 'package:gamepass_clone/domain/rating.dart';

class Game {
  String id;
  String description;
  String logo;
  String publisher;
  Rating rating;
  List<String> ratingReasons;
  String size;
  String title;
  String trailer;

  Game({
    required this.id,
    required this.description,
    required this.logo,
    required this.publisher,
    required this.rating,
    required this.ratingReasons,
    required this.size,
    required this.title,
    required this.trailer,
  });
}
