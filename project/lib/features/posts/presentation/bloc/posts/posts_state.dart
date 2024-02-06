part of 'posts_bloc.dart';

abstract class PostsStates extends Equatable {
  const PostsStates();

  @override
  List<Object> get props => [];
}

class PostsInitial extends PostsStates {}

class LoadingPostsState extends PostsStates {}

class LoadedPostsState extends PostsStates {
  final List<Post> todos;

  const LoadedPostsState({required this.todos});

  @override
  List<Object> get props => [todos];
}

class ErrorPostsState extends PostsStates {
  final String message;

  const ErrorPostsState({required this.message});
  @override
  List<Object> get props => [message];
}
