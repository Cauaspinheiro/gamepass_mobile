import 'dart:convert';

import 'package:gamepass_clone/infra/game/game_repository_dto.dart';
import 'package:gamepass_clone/infra/shared/base_repository.dart';
import 'package:http/http.dart' as http;

class GameRepository extends BaseRepository {
  Future<List<GameRepositoryDTO>> findAll() async {
    final endpoint = Uri.parse(this.host + '/games');

    final response = await http.get(endpoint);

    List json = JsonDecoder().convert(response.body);

    final games = json.map((e) => GameRepositoryDTO.fromMap(e)).toList();

    return games;
  }
}
