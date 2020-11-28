import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'sign_up_controller.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({
    Key key,
  }) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends ModularState<SignUpPage, SignUpController> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<SignUpController>(
      builder: (_, controller) => Scaffold(
        body: controller.isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          hintText: '* Name',
                          prefixIcon: Icon(Icons.email),
                        ),
                        validator: (name) =>
                            name.isEmpty ? '* Required Field' : null,
                        onSaved: (name) => controller.name = name,
                      ),
                      SizedBox(height: 12),
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
                        onSaved: (password) => controller.password = password,
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
                                await controller.signUpUser();
                                Modular.to.pop();
                              }
                            },
                            color: Theme.of(context).primaryColor,
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Modular.to.pop();
                            },
                            child: Text(
                              'Already have an account? Sign In',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
