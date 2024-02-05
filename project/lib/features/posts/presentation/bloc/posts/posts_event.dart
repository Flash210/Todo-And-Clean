part of 'posts_bloc.dart';

abstract class PostsEvents extends Equatable{
  const PostsEvents();

  @override
  List<Object> get props =>[];
}

class GetAllPostsEvent extends PostsEvents{}
class RefreshPostsEvents extends PostsEvents{}
