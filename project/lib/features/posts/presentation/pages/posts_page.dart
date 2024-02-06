import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/core/widgets/loading_widget.dart';
import 'package:project/features/posts/presentation/bloc/posts/posts_bloc.dart';
import 'package:project/features/posts/presentation/pages/post_add_or_update.dart';
import 'package:project/features/posts/presentation/widgtes/message_display_widget.dart';
import 'package:project/features/posts/presentation/widgtes/post_list.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
      floatingActionButton: buildFloatingBtn(context),
    );
  }

  buildBody() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: BlocBuilder<PostsBloc,PostsStates>(
        builder: (context,state){
          if ( state is LoadingPostsState){


            return const LoadingWidget();

          }else if ( state is LoadedPostsState){
            return RefreshIndicator(
                onRefresh: () => onRefresh(context),
              child: PostListWidget(
                posts:state.todos
              ),
            );
          }else if ( state is ErrorPostsState){
            return MessageDisplayWidget(message :state.message);
          }
          return const LoadingWidget();
        }
        
        )
    );
  }
  
  Widget buildFloatingBtn( BuildContext context) {
    return FloatingActionButton(
      onPressed: () => {
        Navigator.push(context, MaterialPageRoute(
          builder:(_) =>const PostAddOrUpdate(isUpdate:false  ))
        )
        
      },
      child: const Icon(Icons.add),
    );
  }
  
  Future<void> onRefresh (BuildContext context)async {


BlocProvider.of<PostsBloc>(context).add(RefreshPostsEvents());


  }
}
