import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class PostApiPage extends StatefulWidget {
  const PostApiPage({Key? key}) : super(key: key);

  @override
  State<PostApiPage> createState() => _PostApiPageState();
}

class _PostApiPageState extends State<PostApiPage> {
  String baseUrl = 'http://ec2-54-80-244-185.compute-1.amazonaws.com:3333/api';

  Future postLogin() async {
    try {
      String urlLogin = '$baseUrl/v1/auth/login';

      var body = {'email': 'deveda4217@logodez.com', 'password': 'Teste@123'};

      var response = await Dio().post(urlLogin, data: body);

      print(response.data);
    } catch (e) {
      print('Deu erro na requisição $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.keyboard_arrow_left,
            color: Colors.blue.shade800,
            size: 40,
          ),
        ),
        title: Text(
          'POST',
          style: TextStyle(
            color: Colors.blue.shade800,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue.shade200,
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MaterialButton(
              color: Colors.blue.shade200,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              onPressed: () async {
                await postLogin();
              },
              child: Text(
                'Registrar',
                style: TextStyle(
                  color: Colors.blue.shade800,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
