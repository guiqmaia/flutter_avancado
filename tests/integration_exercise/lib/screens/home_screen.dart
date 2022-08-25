import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/idea_model.dart';
import 'auth_screens/login_screen.dart';
import 'new_idea_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      floatingActionButton: FloatingActionButton(
        key: const ValueKey('addButton'),
        onPressed: () {
          Navigator.push<NewIdeaScreen>(
            context,
            MaterialPageRoute(
              builder: (_) => ChangeNotifierProvider.value(
                value: Provider.of<IdeasModel>(context),
                child: const NewIdeaScreen(),
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.green.shade800,
      ),
      appBar: AppBar(
        title: const Text('Ideas',key: Key('appBarText'),),
        backgroundColor: Colors.green.shade900,
        actions: [
          IconButton(
            key: const ValueKey('LogoutKey'),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute<LoginScreen>(
                  builder: (_) => ChangeNotifierProvider.value(
                    value: Provider.of<IdeasModel>(context),
                    child: const LoginScreen(),
                  ),
                ),
              );
            },
            icon: const Icon(
              Icons.logout_outlined,
            ),
          ),
        ],
      ),
      body: Consumer<IdeasModel>(
        builder: (context, ideasModel, child) {
          final ideasList = ideasModel.getAllIdeas;
          return Visibility(
            visible: ideasList.isNotEmpty,
            replacement: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Add New Idea by clicking add icon below',
                  key: const Key('addIdea'),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.grey.shade400,
                  ),
                ),
              ),
            ),
            child: ListView.builder(
              itemCount: ideasList.length,
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 8,
                  color: Colors.grey.shade200,
                  child: Dismissible(
                    key: ValueKey(ideasList[index].title.toString()),
                    onDismissed: (direction) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            '${ideasList[index].title!} dismissed',
                          ),
                        ),
                      );
                      Provider.of<IdeasModel>(context, listen: false)
                          .deleteIdea(ideasList[index]);
                    },
                    background: Container(color: Colors.redAccent),
                    child: ListTile(
                      title: Text(
                        ideasList[index].title!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        ideasList[index].inspiration!,
                      ),
                      isThreeLine: true,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
