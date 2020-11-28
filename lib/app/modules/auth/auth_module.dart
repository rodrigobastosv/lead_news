import 'package:flutter_modular/flutter_modular.dart';
import 'package:lead_news/app/modules/auth/sign_in/sign_in_controller.dart';
import 'package:lead_news/app/modules/auth/sign_in/sign_in_repository.dart';

import 'sign_in/sign_in_page.dart';
import 'sign_up/sign_up_controller.dart';
import 'sign_up/sign_up_page.dart';
import 'sign_up/sign_up_repository.dart';

class AuthModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((_) => SignInRepository(Modular.get())),
        Bind((_) => SignInController(Modular.get())),
        Bind((_) => SignUpRepository(Modular.get())),
        Bind((_) => SignUpController(Modular.get())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => SignInPage()),
        ModularRouter('sign-up', child: (_, args) => SignUpPage()),
      ];

  static Inject get to => Inject<AuthModule>.of();
}
