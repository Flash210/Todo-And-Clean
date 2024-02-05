import 'package:dartz/dartz.dart';
import 'package:project/features/posts/domain/entities/todo.dart';
import 'package:project/features/posts/domain/repository/todo_repository.dart';

import '../../../../core/error/failure.dart';

class AddPostsUseCase {
  final PostsRepository repository;

  AddPostsUseCase({required this.repository});

  Future<Either<Failure, Unit>> call(TodoEntity todoEntity) async {
    return await repository.addPost(todoEntity);
  }
}
