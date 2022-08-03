import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DeleteApiPage extends StatefulWidget {
  const DeleteApiPage({Key? key}) : super(key: key);

  @override
  State<DeleteApiPage> createState() => _DeleteApiPageState();
}

class _DeleteApiPageState extends State<DeleteApiPage> {
  String baseUrl = 'http://ec2-54-80-244-185.compute-1.amazonaws.com:3333/api';

  Future deleteInfo() async {
    var url =
        'http://ec2-54-80-244-185.compute-1.amazonaws.com:3333/api/v1/owners/service/557a0a51-017a-44ea-8931-594083c0f150';
    var response = await Dio().delete(url);
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
          'DELETE',
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
                await deleteInfo();
              },
              child: Text(
                'Deletar',
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
