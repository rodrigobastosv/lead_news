import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lead_news/app/modules/search-news/search_news_controller.dart';
import 'package:lead_news/app/widgtes/article_card.dart';

class SearchNewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<SearchNewsController>(
        builder: (_, controller) => Scaffold(
          body: controller.isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    children: [
                      TextFormField(
                        initialValue: controller.query,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            suffixIcon: IconButton(
                              onPressed: controller.getNewsByQuery,
                              icon: Icon(Icons.search),
                            ),
                            hintText: 'Search here...'),
                        onChanged: (query) => controller.query = query,
                      ),
                      SizedBox(height: 12),
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemBuilder: (_, i) => ArticleCard(
                            controller.newsByQuery[i],
                          ),
                          itemCount: controller.newsByQuery.length,
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
