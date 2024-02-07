import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/core/utils/snackbar_message.dart';
import 'package:project/core/widgets/loading_widget.dart';
import 'package:project/features/posts/domain/entities/posts.dart';
import 'package:project/features/posts/presentation/bloc/crud/crud_bloc.dart';
import 'package:project/features/posts/presentation/pages/posts_page.dart';
import 'package:project/features/posts/presentation/widgtes/post_and_update_page/form_widget.dart';

class PostAddUpdatePage extends StatelessWidget {
  final Post? post;
  final bool isUpdatePost;
  const PostAddUpdatePage({Key? key, this.post, required this.isUpdatePost})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppbar() {
    return AppBar(title: Text(isUpdatePost ? "Edit Post" : "Add Post"));
  }

  Widget _buildBody() {
    return Center(
      child: Padding(
          padding: const EdgeInsets.all(10),
          child:
              BlocConsumer<CrudBloc, CrudState>(
            listener: (context, state) {
              if (state is SuccesCrudState) {
                SnackBarMessage().showSuccessMessage(
                   context: context, message: state.message);
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (_) => const PostsPage()),
                    (route) => false);
              } else if (state is ErrorCrudState) {
                SnackBarMessage().showErrorMessage(
                    message: state.message, context: context);
              }
            },
            builder: (context, state) {
              if (state is LoadingState) {
                return const LoadingWidget();
              }

              return FormWidget(
                  isUpdatePost: isUpdatePost, post: isUpdatePost ? post : null);
            },
          )),
    );
  }
}