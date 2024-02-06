import 'package:flutter/material.dart';
import 'package:project/features/posts/domain/entities/posts.dart';

class PostListWidget extends StatelessWidget {
  final List<Post> posts;
  const PostListWidget({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(posts[index].completed.toString()),
          subtitle: Text(posts[index].title.toString()),
          contentPadding: const EdgeInsets.all(10),
          onTap: () => {},
          leading: Text(posts[index].userId.toString()),
        );
      },
      separatorBuilder: (context, index) => const Divider(
        thickness: 1,
      ),
    );
  }
}
