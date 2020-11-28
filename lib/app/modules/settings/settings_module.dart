import 'package:flutter_modular/flutter_modular.dart';

import 'settings_page.dart';

class SettingsModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (_, args) => SettingsPage()),
      ];

  static Inject get to => Inject<SettingsModule>.of();
}
