import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:project/core/error/failure.dart';
import 'package:project/features/posts/domain/entities/todo.dart';
import 'package:project/features/posts/domain/usecases/add_todo.dart';
import 'package:project/features/posts/domain/usecases/delete_todo.dart';
import 'package:project/features/posts/domain/usecases/update_todo.dart';

part 'crud_event.dart';
part 'crud_state.dart';

class CrudBloc extends Bloc<CrudEvent, CrudState> {
  final AddPostsUseCase addPostUseCase;
  final DeletePostUseCAse deletePostUseCase;
  final UpdatePostsUseCase updatePostUseCase;

  CrudBloc(
      {required this.addPostUseCase,
      required this.deletePostUseCase,
      required this.updatePostUseCase})
      : super(CrudInitial()) {
    on<CrudEvent>((event, emit) async {
      if (event is AddPostEvent) {
        emit(LoadingState());

        final failureOrDoneMessage = await addPostUseCase(event.post);

        emit(eitherDoneOrError(failureOrDoneMessage, "Succes Add"));
      } else if (event is UpdatePostEvent) {
        emit(LoadingState());

        final failureOrDoneMessage = await updatePostUseCase(event.post);

        emit(eitherDoneOrError(failureOrDoneMessage, "Update bien"));
      } else if (event is DeletePostEvent) {
        emit(LoadingState());

        final failureOrDoneMessage = await deletePostUseCase(event.postId);

        emit(eitherDoneOrError(failureOrDoneMessage, "Delete Good"));
      }
    });
  }

  CrudState eitherDoneOrError(Either<Failure, Unit> either, String message) {
    return either.fold(
        (failure) => ErorrState(message: mapFailureToMessage(failure)),
        (_) => SuccesCrud(message: message));
  }

  String mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return "";
      case OffLineFailure:
        return "";
      default:
        return "Unpexted Error ";
    }
  }
}
