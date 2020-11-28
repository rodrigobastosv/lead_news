import 'package:dio/dio.dart';
import 'package:lead_news/app/core/dio.dart';
import 'package:lead_news/app/core/entity/article_model.dart';

class TopHeadlinesRepository {
  TopHeadlinesRepository(this.client);

  final Dio client;

  Future<List<ArticleModel>> getHeadlines() async {
    final response = await client
        .get('$newsApiBaseUrl/$TOP_HEADLINES/?country=us&apiKey=$apiKey');
    if (response.statusCode == 200) {
      final articlesList = response.data['articles'] as List;
      return List.generate(
        articlesList.length,
        (i) => ArticleModel.fromJson(articlesList[i]),
      );
    }
    return [];
  }
}
