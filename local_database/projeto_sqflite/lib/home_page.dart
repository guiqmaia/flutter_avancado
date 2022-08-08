import 'package:flutter/material.dart';

import 'database_helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final dbHelper = DatabaseHelper.instance;

  TextEditingController textController = TextEditingController();

  Future saveText() async {
    if (textController.text.isNotEmpty) {
      var response = await dbHelper.insertText(textController.text);
    }
    setState(() {});
  }

  Future<String> getText() async {
    return dbHelper.getText();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'TELL ME WHY',
          style: TextStyle(
            letterSpacing: 3,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextFormField(
              controller: textController,
              decoration: const InputDecoration(
                hintText: 'Digite algo',
              ),
            ),
            const Spacer(),
            FutureBuilder(
              future: getText(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data);
                }
                return const CircularProgressIndicator();
              },
            ),
            const Spacer(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          saveText();
          textController.clear();
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}
