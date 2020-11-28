import 'package:dio/dio.dart';
import 'package:lead_news/app/core/dio.dart';
import 'package:lead_news/app/core/entity/user_model.dart';

class SignInRepository {
  SignInRepository(this.client);

  final Dio client;

  Future<UserModel> signInUser(String email, String password) async {
    final response = await client.post(
      '$authApiBaseUrl/$SIGN_IN',
      data: {
        'email': email,
        'password': password,
      },
    );
    return UserModel.fromJson(response.data);
  }

  Future<UserModel> signInAdminUser(String email, String password) async {
    final response = await client.post(
      '$authApiBaseUrl/$SIGN_IN_ADMIN',
      data: {
        'email': email,
        'password': password,
      },
    );
    return UserModel.fromJson(response.data);
  }
}
