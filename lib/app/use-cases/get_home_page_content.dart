import 'package:gamepass_clone/domain/home_page_content.dart';
import 'package:gamepass_clone/infra/home_page_content/home_page_content_model.dart';
import 'package:gamepass_clone/infra/home_page_content/home_page_content_repository.dart';

class GetHomePageContentUseCase {
  Future<HomePageContent> handle() async {
    final data = await HomePageContentRepository().find();

    final pageContent = HomePageContentModel.fromRepository(data);

    return pageContent;
  }
}
