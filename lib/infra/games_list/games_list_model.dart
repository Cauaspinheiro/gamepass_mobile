import 'package:gamepass_clone/domain/games_list.dart';
import 'package:gamepass_clone/infra/game/game_model.dart';
import 'package:gamepass_clone/infra/games_list/games_list_repository_dto.dart';

class GamesListModel {
  static GamesList fromRepository(GamesListRepositoryDTO data) {
    return new GamesList(
      games: data.games.map((e) => GameModel.fromRepository(e)).toList(),
      title: data.title,
      id: data.id,
    );
  }
}
