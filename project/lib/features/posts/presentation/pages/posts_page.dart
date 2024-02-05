import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/core/widgets/loading_widget.dart';
import 'package:project/features/posts/presentation/bloc/posts/posts_bloc.dart';
import 'package:project/features/posts/presentation/widgtes/message_display_widget.dart';
import 'package:project/features/posts/presentation/widgtes/post_list.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
      floatingActionButton: buildFloatingBtn(),
    );
  }

  buildBody() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: BlocBuilder<PostsBloc,PostsStates>(
        builder: (context,state){
          if ( state is LoadingPostsState){


            return LoadingWidget();

          }else if ( state is LoadedPostsState){
            return PostListWidget(
              posts:state.todos
            );
          }else if ( state is ErrorPostsState){
            return MessageDisplayWidget(message :state.message);
          }
          return LoadingWidget();
        }
        
        )
    );
  }
  
  Widget buildFloatingBtn() {
    return FloatingActionButton(
      onPressed: () => {},
      child: Icon(Icons.add),
    );
  }
}
