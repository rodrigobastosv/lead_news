import 'package:flutter_modular/flutter_modular.dart';
import 'package:lead_news/app/modules/search-news/search_news_repository.dart';

import 'search_news_controller.dart';
import 'search_news_page.dart';

class SearchNewsModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((_) => SearchNewsRepository(Modular.get())),
        Bind((_) => SearchNewsController(Modular.get())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (_, args) => SearchNewsPage()),
      ];

  static Inject get to => Inject<SearchNewsModule>.of();
}
