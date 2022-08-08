import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'post_provider.dart';

class PostsPage extends StatefulHookConsumerWidget {
  const PostsPage({Key? key}) : super(key: key);

  @override
  ConsumerState<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends ConsumerState<PostsPage> {
  // final PostListRepository repository = PostListRepository(Dio());

  // late Future<List<PostModel>> results;

  // @override
  // void initState() {
  //   super.initState();
  //   results = repository.getAllPosts();
  // }

  @override
  Widget build(BuildContext context) {
    final posts = ref.watch(postProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Results'),
        centerTitle: true,
      ),
      body: Center(
        child: Visibility(
          visible: posts.isNotEmpty,
          replacement: const CircularProgressIndicator(),
          child: ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: Text(
                    posts[index].id.toString(),
                  ),
                  title: Text(posts[index].title),
                  subtitle: Text(posts[index].body),
                ),
              );
            },
          ),
        ),
        // child: FutureBuilder(
        //   future: results,
        //   builder: (context, AsyncSnapshot<List<PostModel>> snapshot) {
        //     if (snapshot.hasData) {
        //       List<PostModel>? post = snapshot.data;
        //       return ListView.builder(
        //         itemCount: post!.length,
        //         itemBuilder: (context, index) {
        //           return Card(
        //             child: ListTile(
        //               leading: Text(
        //                 post[index].id.toString(),
        //               ),
        //               title: Text(post[index].title),
        //               subtitle: Text(post[index].body),
        //             ),
        //           );
        //         },
        //       );
        //     }
        //     return const CircularProgressIndicator();
        //   },
        // ),
      ),
    );
  }
}
