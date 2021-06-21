import 'dart:convert';

import 'package:gamepass_clone/infra/games_list/games_list_repository_dto.dart';
import 'package:gamepass_clone/infra/shared/base_repository.dart';
import 'package:http/http.dart' as http;

class GamesListRepository extends BaseRepository {
  Future<List<GamesListRepositoryDTO>> findAll() async {
    final endpoint = Uri.parse(this.host + '/lists');

    final response = await http.get(endpoint);

    List json = JsonDecoder().convert(response.body);

    final gamesLists = json.map((e) => GamesListRepositoryDTO.fromMap(e)).toList();

    return gamesLists;
  }
}
