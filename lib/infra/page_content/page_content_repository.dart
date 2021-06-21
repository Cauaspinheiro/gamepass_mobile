import 'dart:convert';

import 'package:gamepass_clone/infra/page_content/page_content_repository_dto.dart';
import 'package:gamepass_clone/infra/shared/base_repository.dart';
import 'package:http/http.dart' as http;

class PageContentRepository extends BaseRepository {
  Future<List<PageContentRepositoryDTO>> findAll() async {
    final endpoint = Uri.parse(this.host + '/pages');

    final response = await http.get(endpoint);

    List json = JsonDecoder().convert(response.body);

    final pagesContents =
        json.map((e) => PageContentRepositoryDTO.fromMap(e)).toList();

    return pagesContents;
  }

  Future<PageContentRepositoryDTO> findByTitle(String title) async {
    final endpoint = Uri.parse(this.host + '/pages/$title');

    final response = await http.get(endpoint);

    final json = JsonDecoder().convert(response.body);

    final pageContent = PageContentRepositoryDTO.fromMap(json);

    return pageContent;
  }
}
