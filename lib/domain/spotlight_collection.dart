import 'package:gamepass/domain/spotlight.dart';

class SpotLightCollection {
  List<Spotlight> games;
  String title;
  String id;

  SpotLightCollection({
    required this.games,
    required this.title,
    required this.id,
  });
}
