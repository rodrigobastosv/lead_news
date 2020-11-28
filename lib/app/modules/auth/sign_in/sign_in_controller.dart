import 'package:flutter/cupertino.dart';
import 'package:lead_news/app/core/entity/user_model.dart';

import 'sign_in_repository.dart';

class SignInController extends ChangeNotifier {
  SignInController(this.repository);

  final SignInRepository repository;

  String email;
  String password;
  bool isLoading = false;

  Future<UserModel> signInUser() async {
    isLoading = true;
    notifyListeners();
    final user = await repository.signInUser(email, password);
    isLoading = false;
    notifyListeners();

    return user;
  }

  Future<UserModel> signInAdminUser() async {
    isLoading = true;
    notifyListeners();
    final user = await repository.signInAdminUser(email, password);
    isLoading = false;
    notifyListeners();

    return user;
  }
}
