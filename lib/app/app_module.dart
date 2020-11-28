import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lead_news/app/app_widget.dart';
import 'package:lead_news/app/modules/auth/auth_controller.dart';
import 'package:lead_news/app/modules/settings/settings_module.dart';

import 'modules/auth/auth_module.dart';
import 'modules/home/home_module.dart';
import 'modules/search-news/search_news_module.dart';
import 'modules/top_headlines/top_headlines_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((_) => Dio()),
        Bind((_) => AuthController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, module: AuthModule()),
        ModularRouter('/home', module: HomeModule()),
        ModularRouter('/top-headlines', module: TopHeadlinesModule()),
        ModularRouter('/search-news', module: SearchNewsModule()),
        ModularRouter('/settings', module: SettingsModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
