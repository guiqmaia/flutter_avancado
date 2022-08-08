import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final textController = TextEditingController();
  final storage = LocalStorage('data.json');

  saveInfoStorage() async {
    await storage.setItem('title', textController.text);
    setState(() {});
  }

  removeInfoStorage() async {
    await storage.deleteItem('title');
    setState(() {});
  }

  String getInfoStorage() {
    return storage.getItem('title') ?? 'Não encontrada';
  }

  clearStorage() async {
    await storage.clear();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HOME'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              TextFormField(
                controller: textController,
                decoration: InputDecoration(
                  labelText: 'Escreva Alguma Coisa',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Colors.pink,
                        width: 5,
                      )),
                ),
              ),
              const SizedBox(height: 20),
              FutureBuilder(
                future: storage.ready,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var title = getInfoStorage();
                    return ListTile(
                      title: Text(
                        title,
                        textAlign: TextAlign.center,
                      ),
                    );
                  }
                  return Column(
                    children: const [
                      CircularProgressIndicator(),
                      SizedBox(height: 10),
                      Text('Loading Data'),
                    ],
                  );
                },
              ),
              MaterialButton(
                onPressed: removeInfoStorage,
                child: const Icon(
                  Icons.clear,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          saveInfoStorage();
          textController.clear();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
