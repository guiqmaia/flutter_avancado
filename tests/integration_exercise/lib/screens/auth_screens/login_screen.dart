// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/idea_model.dart';
import '../home_screen.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: ListView(
        children: [
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: TextFormField(
                      key: const ValueKey('emailLoginField'),
                      controller: _emailController,
                      cursorColor: Colors.green.shade900,
                      style: TextStyle(color: Colors.grey.shade400),
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          color: Colors.grey.shade400,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            color: Colors.green.shade900,
                            width: 2,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      validator: (value) => !value!.contains('@') ? 'invalid email' : null,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: TextFormField(
                      key: const ValueKey('passwordLoginField'),
                      controller: _passwordController,
                      obscureText: true,
                      cursorColor: Colors.green.shade900,
                      style: TextStyle(color: Colors.grey.shade400),
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(
                          color: Colors.grey.shade400,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            color: Colors.green.shade900,
                            width: 2,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      validator: (value) => value!.length <= 6 ? 'Precisa ter mais de 6' : null,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              key: const Key('goToHomePage'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith(
                  (states) => Colors.green.shade800,
                ),
              ),
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute<HomeScreen>(
                      builder: (_) => ChangeNotifierProvider(
                        create: (_) => IdeasModel(),
                        child: const HomeScreen(),
                      ),
                    ),
                  );
                }
              },
              child: const Text('Login'),
            ),
          ),
          TextButton(
            key: const Key('goToSignUpPage'),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute<SignUpScreen>(
                builder: (context) => const SignUpScreen(),
              ));
            },
            child: const Text('Sign Up'),
          ),
        ],
      ),
    );
  }
}
