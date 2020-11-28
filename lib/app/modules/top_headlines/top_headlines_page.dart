import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lead_news/app/modules/top_headlines/top_headlines_controller.dart';
import 'package:lead_news/app/widgtes/article_card.dart';

class TopHeadlinesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TopHeadlinesController>(
      builder: (_, controller) => Scaffold(
        body: controller.isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.all(18),
                child: ListView.builder(
                  itemBuilder: (_, i) =>
                      ArticleCard(controller.topHeadlines[i]),
                  itemCount: controller.topHeadlines.length,
                ),
              ),
      ),
    );
  }
}
