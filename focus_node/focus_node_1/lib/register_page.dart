import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  static const route = '/page-two';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  FocusNode focusEmail = FocusNode();
  FocusNode focusCpf = FocusNode();
  FocusNode focusBirthDate = FocusNode();
  FocusNode focusAge = FocusNode();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(height: 20),
            TextFormField(
              autofocus: true,
              decoration: const InputDecoration(
                hintText: 'Name',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Campo está vazio';
                }
                return null;
              },
              onFieldSubmitted: (value) {
                focusEmail.requestFocus();
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              focusNode: focusEmail,
              decoration: const InputDecoration(
                hintText: 'E-mail',
              ),
              onFieldSubmitted: (value) {
                focusCpf.requestFocus();
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              focusNode: focusCpf,
              decoration: const InputDecoration(
                hintText: 'CPF',
              ),
              onFieldSubmitted: (value) {
                focusBirthDate.requestFocus();
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              focusNode: focusBirthDate,
              decoration: const InputDecoration(
                hintText: 'BirthDate',
              ),
              onFieldSubmitted: (value) {
                focusAge.requestFocus();
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              focusNode: focusAge,
              decoration: const InputDecoration(
                hintText: 'Age',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  print('Tá validado');
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text(
                        'Você precisa declarar os dados corretamente',
                        style: TextStyle(color: Colors.black),
                      ),
                      backgroundColor: Colors.grey.shade100,
                    ),
                  );
                }
              },
              child: const Text('Registrar'),
            ),
          ],
        ),
      ),
    );
  }
}
