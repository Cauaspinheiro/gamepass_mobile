import 'package:gamepass_clone/domain/page_content.dart';
import 'package:gamepass_clone/infra/game/game_model.dart';
import 'package:gamepass_clone/infra/games_list/games_list_model.dart';
import 'package:gamepass_clone/infra/page_content/page_content_repository_dto.dart';

class PageContentModel {
  static PageContent fromRepository(PageContentRepositoryDTO data) {
    return PageContent(
      id: data.id,
      title: data.title,
      spotlight: GameModel.fromRepository(data.spotlight),
      gamesLists: data.games_lists
          .map((e) => GamesListModel.fromRepository(e))
          .toList(),
    );
  }
}
