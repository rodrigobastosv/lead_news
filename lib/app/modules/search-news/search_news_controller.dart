import 'package:flutter/cupertino.dart';
import 'package:lead_news/app/core/entity/article_model.dart';

import 'search_news_repository.dart';

class SearchNewsController extends ChangeNotifier {
  SearchNewsController(this.repository);

  final SearchNewsRepository repository;
  List<ArticleModel> newsByQuery = [];
  String query = '';
  bool isLoading = false;

  Future<void> getNewsByQuery() async {
    isLoading = true;
    notifyListeners();

    newsByQuery = await repository.getNewsByQuery(query);

    isLoading = false;
    notifyListeners();
  }
}
