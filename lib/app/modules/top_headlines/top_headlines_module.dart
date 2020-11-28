import 'package:flutter_modular/flutter_modular.dart';
import 'package:lead_news/app/modules/top_headlines/top_headlines_controller.dart';
import 'package:lead_news/app/modules/top_headlines/top_headlines_page.dart';
import 'package:lead_news/app/modules/top_headlines/top_headlines_repository.dart';

class TopHeadlinesModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((_) => TopHeadlinesRepository(Modular.get())),
        Bind((_) => TopHeadlinesController(Modular.get())..getHeadlines()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (_, args) => TopHeadlinesPage()),
      ];

  static Inject get to => Inject<TopHeadlinesModule>.of();
}
