import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:project/core/error/failure.dart';
import 'package:project/features/posts/domain/entities/posts.dart';
import 'package:project/features/posts/domain/usecases/get_all_todos.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvents, PostsStates> {
  final GetAllPostsUseCase getAllTodosUseCase;

  PostsBloc(this.getAllTodosUseCase) : super(PostsInitial()) {
    on<PostsEvents>((event, emit) async {
      // TODO: implement event handler

      if (event is GetAllPostsEvent) {
        emit(LoadingPostsState());
        final failureOrPost = await getAllTodosUseCase();
        emit(mapFailureOrPostToState(failureOrPost));
      } else {
        if (event is RefreshPostsEvents) {
          emit(LoadingPostsState());
          final failureOrPost = await getAllTodosUseCase();
          emit(mapFailureOrPostToState(failureOrPost));
        }
      }
    });
  }

  PostsStates mapFailureOrPostToState(Either<Failure, List<Posts>> either) {
    return either.fold(
        (failure) => ErrorPostsState(message: mapFailureToMessage(failure)),
        (posts) => LoadedPostsState(todos: posts));
  }

  String mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return "";
      case EmptyCasheFailure:
        return "";
      case OffLineFailure:
        return "";
      default:
        return "Unpexted Error ";
    }
  }
}
