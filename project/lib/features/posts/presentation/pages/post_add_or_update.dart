import 'package:flutter/material.dart';
import 'package:project/features/posts/domain/entities/posts.dart';

class PostAddOrUpdate extends StatelessWidget {
  final Post? post;
  final bool isUpdate;
  const PostAddOrUpdate({super.key, this.post, required this.isUpdate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text( isUpdate ?'Update Post' : 'Add Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Body',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => {},
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
