import 'package:flutter/cupertino.dart';
import 'package:lead_news/app/core/entity/article_model.dart';

import 'top_headlines_repository.dart';

class TopHeadlinesController extends ChangeNotifier {
  TopHeadlinesController(this.repository);

  final TopHeadlinesRepository repository;
  List<ArticleModel> topHeadlines = [];
  bool isLoading = false;

  Future<void> getHeadlines() async {
    isLoading = true;
    notifyListeners();

    topHeadlines = await repository.getHeadlines();

    isLoading = false;
    notifyListeners();
  }
}
