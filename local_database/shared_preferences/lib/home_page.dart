import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _prefs = SharedPreferences.getInstance();

  TextEditingController textController = TextEditingController();

  saveInfoStorage() async {
    final myPrefs = await _prefs;
    String title = textController.text;
    await myPrefs.setString('title', title);
    setState(() {});
  }

  Future<String> getInfoStorage() async {
    return _prefs
        .then((SharedPreferences shared) => shared.getString('title') ?? '');
  }

  removeInfoStorage() async {
    final myPrefs = await _prefs;
    myPrefs.remove('title');
    setState(() {});
  }

  removeAllInfoStorage() async {
    final myPrefs = await _prefs;
    await myPrefs.clear();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shared Preferences'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextFormField(
                controller: textController,
                decoration: const InputDecoration(
                  labelText: 'Digite o título',
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.green,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              FutureBuilder(
                future: getInfoStorage(),
                builder: (context, AsyncSnapshot<String> snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                      snapshot.data!,
                    );
                  }
                  return const Text('Loading Data');
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            onPressed: () async {
              await saveInfoStorage();
              textController.clear();
            },
            child: const Icon(Icons.save),
          ),
          FloatingActionButton(
            onPressed: () {
              removeInfoStorage();
            },
            child: const Icon(Icons.delete),
          ),
          FloatingActionButton(
            onPressed: () {
              removeAllInfoStorage();
            },
            child: const Icon(Icons.clear_all),
          ),
        ],
      ),
    );
  }
}
