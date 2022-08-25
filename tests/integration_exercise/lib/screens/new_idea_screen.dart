// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/idea_model.dart';

class NewIdeaScreen extends StatefulWidget {
  const NewIdeaScreen({Key? key}) : super(key: key);

  @override
  _NewIdeaScreenState createState() => _NewIdeaScreenState();
}

class _NewIdeaScreenState extends State<NewIdeaScreen> {
  final TextEditingController _ideaNameController = TextEditingController();
  final TextEditingController _ideaInspirationController = TextEditingController();
  final _newIdeaFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.symmetric(vertical: 52),
            child: Column(
              children: [
                Text(
                  'Add new Idea',
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.grey.shade400,
                  ),
                  textAlign: TextAlign.center,
                ),
                Form(
                  key: _newIdeaFormKey,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: TextFormField(
                            key: const ValueKey('newIdeaField'),
                            controller: _ideaNameController,
                            cursorColor: Colors.green.shade900,
                            style: TextStyle(color: Colors.grey.shade400),
                            decoration: InputDecoration(
                              labelText: 'Idea Title',
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
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: TextFormField(
                            key: const ValueKey('inspirationField'),
                            controller: _ideaInspirationController,
                            cursorColor: Colors.green.shade900,
                            style: TextStyle(color: Colors.grey.shade400),
                            decoration: InputDecoration(
                              labelText: 'Inspiration',
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
                            maxLines: 5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButton(
                      key: const Key('addIdeaButton'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith(
                          (states) => Colors.green.shade800,
                        ),
                      ),
                      onPressed: () {
                        if (_newIdeaFormKey.currentState!.validate()) {
                          Provider.of<IdeasModel>(context, listen: false).addIdea(
                            Idea(
                              title: _ideaNameController.value.text.trim(),
                              inspiration: _ideaInspirationController.value.text.trim(),
                              date: DateTime.now().toIso8601String(),
                            ),
                          );
                          Navigator.of(context).pop();
                        }
                      },
                      child: const Text(
                        'Add',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
