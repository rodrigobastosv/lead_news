import 'package:flutter_modular/flutter_modular.dart';
import 'package:lead_news/app/modules/auth/auth_controller.dart';

class AdminGuard extends RouteGuard {
  @override
  bool canActivate(String url) {
    final user = Modular.get<AuthController>().user;
    return user.isAdmin;
  }

  @override
  List<GuardExecutor> get executors => [];
}
