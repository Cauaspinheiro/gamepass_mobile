import 'dart:convert';

import 'package:gamepass/infra/home_page_content/dto/home_page_content_repository_dto.dart';

import 'package:gamepass/infra/shared/base_repository.dart';
import 'package:http/http.dart' as http;

class HomePageContentRepository extends BaseRepository {
  Future<HomePageContentRepositoryDTO> find() async {
    final endpoint = Uri.parse(this.host + '/content/home');

    final response = await http.get(endpoint);

    final json = JsonDecoder().convert(response.body);

    final homePageContent = HomePageContentRepositoryDTO.fromMap(json);

    return homePageContent;
  }
}
