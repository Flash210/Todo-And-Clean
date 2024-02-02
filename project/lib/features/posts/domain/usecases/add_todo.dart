

import 'package:dartz/dartz.dart';
import 'package:project/features/posts/domain/entities/todo.dart';
import 'package:project/features/posts/domain/repository/todo_repository.dart';

import '../../../../core/error/failure.dart';

class AddTodoUseCase{


  final TodoRepository repository ;

  AddTodoUseCase(this.repository);

  Future<Either<Failure, Unit>> call(TodoEntity todoEntity) async{
    return await repository.addPost(todoEntity);
  }


}