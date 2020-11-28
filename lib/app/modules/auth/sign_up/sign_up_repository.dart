import 'package:dio/dio.dart';
import 'package:lead_news/app/core/dio.dart';

class SignUpRepository {
  SignUpRepository(this.client);

  final Dio client;

  Future<void> signUpUser(String name, String email, String password) async {
    await client.post(
      '$authApiBaseUrl/$SIGN_UP',
      data: {
        'name': name,
        'email': email,
        'password': password,
      },
    );
  }
}
