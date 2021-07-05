import 'dart:convert';

import 'package:gamepass/infra/game_collection/dto/game_collection_repository_dto.dart';
import 'package:gamepass/infra/shared/base_repository.dart';
import 'package:http/http.dart' as http;

class GameCollectionRepository extends BaseRepository {
  Future<List<GameCollectionRepositoryDTO>> findAll() async {
    final endpoint = Uri.parse(this.host + '/collections');

    final response = await http.get(endpoint);

    List json = JsonDecoder().convert(response.body);

    final gamesLists =
        json.map((e) => GameCollectionRepositoryDTO.fromMap(e)).toList();

    return gamesLists;
  }
}
