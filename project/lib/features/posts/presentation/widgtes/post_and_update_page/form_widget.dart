import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/features/posts/domain/entities/posts.dart';
import 'package:project/features/posts/presentation/bloc/crud/crud_bloc.dart';

class FormWidget extends StatefulWidget {
  final bool isUpdatePost;
  final Post? post;

  const FormWidget({Key? key, required this.isUpdatePost,  this.post})
      : super(key: key);

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  @override
  void initState() {
    titleController.text = widget.post?.title ?? '';
    bodyController.text = widget.post?.completed.toString() ?? '';
    super.initState();
  }

  void validateFormThenUpdateOrAddPost() {

        final isValid = formKey.currentState!.validate();

    if (isValid) {
      final postE = Post(
        id: widget.isUpdatePost ? widget.post!.id : null,
        title: titleController.text,
        completed: bodyController.text.toLowerCase() == 'true' ? true : false,
      );

      if (widget.isUpdatePost) {
        BlocProvider.of<CrudBloc>(context).add(UpdatePostEvent(post: postE));
      } else {
        BlocProvider.of<CrudBloc>(context).add(AddPostEvent(post: postE));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextFormField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
                hintText: 'Enter the title',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter the title';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextFormField(
              controller: bodyController,
              decoration: const InputDecoration(
                labelText: 'Body',
                hintText: 'Enter the body',
              ),
              minLines: 6,
              maxLines: 6,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter the body';
                }
                return null;
              },
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: validateFormThenUpdateOrAddPost, // Call the method here
            icon: widget.isUpdatePost ? const Icon(Icons.update) : const Icon(Icons.add),
            label: Text(widget.isUpdatePost ? 'Update' : 'Add'),
          ),
        ],
      ),
    );
  }
}
