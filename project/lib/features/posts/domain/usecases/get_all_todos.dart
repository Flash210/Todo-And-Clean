import 'package:dartz/dartz.dart';
import 'package:project/core/error/failure.dart';
import 'package:project/features/posts/domain/repository/todo_repository.dart';

import '../entities/todo.dart';

class GetAllTodosUseCase {
  final TodoRepository repository;

  GetAllTodosUseCase(this.repository);

  Future<Either<Failure, List<TodoEntity>>> call() async {
    return await repository.getAllTodos();
  }

/*
why we call our method call not getALl 
every class contain a call method not implementing 
*/
}
