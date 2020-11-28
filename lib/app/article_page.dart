import 'package:flutter/material.dart';
import 'package:lead_news/app/core/entity/article_model.dart';

class ArticlePage extends StatelessWidget {
  ArticlePage(this.article);

  final ArticleModel article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: article.title,
            child: Image.network(article.urlToImage),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              article.title,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(article.description),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(article.publishedAt),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              article.url,
              style: TextStyle(
                fontStyle: FontStyle.italic,
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
