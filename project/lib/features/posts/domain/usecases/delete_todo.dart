




import 'package:dartz/dartz.dart';
import 'package:project/core/error/failure.dart';
import 'package:project/features/posts/domain/repository/todo_repository.dart';

import '../entities/todo.dart';

class DeleteTodoUseCAse{

  final TodoRepository repository;

  DeleteTodoUseCAse(this.repository);


    Future<Either<Failure,Unit>> call(int id) async{
      
      return await repository.deletePost(id);
    }

}