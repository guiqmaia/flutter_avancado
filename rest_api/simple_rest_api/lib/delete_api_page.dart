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
        title: const Text(
          'DELETE',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blueGrey.shade800,
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.keyboard_arrow_left,
            color: Colors.white,
            size: 40,
          ),
        ),
        centerTitle: true,
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
