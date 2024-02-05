import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project/features/posts/domain/entities/posts.dart';

class PostListWidget extends StatelessWidget {
  final List<Posts> posts;
  const PostListWidget({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    return  ListView.separated(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(posts[index].title.toString()),
          subtitle: Text(posts[index].id.toString()),
          contentPadding: EdgeInsets.all(10),
          onTap: () => {},
          leading: Text(posts[index].userId.toString()),
         
        );
      
        
      },
      separatorBuilder: (context, index)=>Divider(thickness: 1,),
    );
  }
}
