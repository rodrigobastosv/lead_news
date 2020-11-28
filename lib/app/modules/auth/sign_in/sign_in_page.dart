import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lead_news/app/modules/auth/auth_controller.dart';
import 'package:lead_news/app/modules/auth/sign_in/sign_in_controller.dart';

class SignInPage extends StatefulWidget {
  SignInPage({
    Key key,
  }) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends ModularState<SignInPage, SignInController> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<SignInController>(
      builder: (_, controller) => Scaffold(
        body: controller.isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: SingleChildScrollView(
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                            'https://joebalestrino.com/wp-content/uploads/2019/02/Marketplace-Lending-News.jpg',
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              hintText: '* E-mail',
                              prefixIcon: Icon(Icons.email),
                            ),
                            validator: (email) =>
                                email.isEmpty ? '* Required Field' : null,
                            onSaved: (email) => controller.email = email,
                          ),
                          SizedBox(height: 12),
                          TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              hintText: '* Password',
                              prefixIcon: Icon(Icons.lock),
                            ),
                            obscureText: true,
                            validator: (password) =>
                                password.isEmpty ? '* Required Field' : null,
                            onSaved: (password) =>
                                controller.password = password,
                          ),
                          SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RaisedButton(
                                onPressed: () async {
                                  final form = _formKey.currentState;
                                  if (form.validate()) {
                                    form.save();
                                    final user = await controller.signInUser();
                                    Modular.get<AuthController>().user = user;
                                    Modular.to.pushReplacementNamed('/home');
                                  }
                                },
                                color: Theme.of(context).primaryColor,
                                child: Text(
                                  'Sign In',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Modular.to.pushNamed('/sign-up');
                                },
                                child: Text(
                                  'Don\'t have an account? Create one',
                                ),
                              ),
                            ],
                          ),
                          RaisedButton(
                            onPressed: () async {
                              final form = _formKey.currentState;
                              if (form.validate()) {
                                form.save();
                                final user = await controller.signInAdminUser();
                                Modular.get<AuthController>().user = user;
                                Modular.to.pushReplacementNamed('/home');
                              }
                            },
                            color: Theme.of(context).primaryColor,
                            child: Text(
                              'Sign In ADMIN',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
