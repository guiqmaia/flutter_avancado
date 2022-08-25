
// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/idea_model.dart';
import '../home_screen.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: ListView(children: [
        Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    'Signup',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.grey.shade400,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: TextFormField(
                    key: const Key('text_field_signup_email'),
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
                    validator: (s) => !s!.contains('@') ? 'invalid email' : null,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: TextFormField(
                    key: const Key('text_field_signup_password'),
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
                    validator: (s) =>
                        s!.length <= 6 ? 'Password must be greater than 6' : null,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: TextFormField(
                    key: const Key('text_field_signup_confirm_password'),
                    controller: _confirmPasswordController,
                    obscureText: true,
                    cursorColor: Colors.green.shade900,
                    style: TextStyle(color: Colors.grey.shade400),
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
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
                    validator: (s) => _passwordController.value.text !=
                            _confirmPasswordController.value.text
                        ? 'Password dont match'
                        : null,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.all(16),
          child: ElevatedButton(
            key: const Key('SignUpButton'),
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
                      create: (context) => IdeasModel(),
                      child: const HomeScreen(),
                    ),
                  ),
                );
              }
            },
            child: const Text('Sign Up!'),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute<LoginScreen>(
                builder: (_) => ChangeNotifierProvider(
                  create: (context) => IdeasModel(),
                  child: const LoginScreen(),
                ),
              ),
            );
          },
          child: const Text('Login'),
        ),
      ]),
    );
  }
}
