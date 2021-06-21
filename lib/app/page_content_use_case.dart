import 'package:gamepass_clone/domain/page_content.dart';
import 'package:gamepass_clone/infra/page_content/page_content_model.dart';
import 'package:gamepass_clone/infra/page_content/page_content_repository.dart';

class PageContentUseCase {
  Future<PageContent> findByTitle(String title) async {
    final data = await PageContentRepository().findByTitle(title);

    final pageContent = PageContentModel.fromRepository(data);

    return pageContent;
  }
}
