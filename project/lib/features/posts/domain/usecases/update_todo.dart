

import 'package:dartz/dartz.dart';
import 'package:project/core/error/failure.dart';
import 'package:project/features/posts/domain/entities/todo.dart';
import 'package:project/features/posts/domain/repository/todo_repository.dart';

class UpdateTodoUseCase {


final TodoRepository repository;

  UpdateTodoUseCase(this.repository);


  Future<Either<Failure, Unit>> call(TodoEntity todoEntity) async{
    return await repository.updatePost(todoEntity);
  }


}