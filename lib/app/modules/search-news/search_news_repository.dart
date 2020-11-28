import 'package:dio/dio.dart';
import 'package:lead_news/app/core/dio.dart';
import 'package:lead_news/app/core/entity/article_model.dart';

class SearchNewsRepository {
  SearchNewsRepository(this.client);

  final Dio client;

  Future<List<ArticleModel>> getNewsByQuery(String query) async {
    final response = await client
        .get('$newsApiBaseUrl/$EVERYTHING/?q=$query&apiKey=$apiKey');
    if (response.statusCode == 200) {
      final articlesList = response.data['articles'] as List;
      return List.generate(
        articlesList.length,
        (i) => ArticleModel.fromJson(articlesList[i]),
      );
    }
  }
}
