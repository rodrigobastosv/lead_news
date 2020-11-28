import 'package:flutter/cupertino.dart';

import 'sign_up_repository.dart';

class SignUpController extends ChangeNotifier {
  SignUpController(this.repository);

  final SignUpRepository repository;

  String name;
  String email;
  String password;
  bool isLoading = false;

  Future<void> signUpUser() async {
    isLoading = true;
    notifyListeners();
    await repository.signUpUser(name, email, password);
    isLoading = false;
    notifyListeners();
  }
}
