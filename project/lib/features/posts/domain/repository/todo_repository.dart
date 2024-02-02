import 'package:dartz/dartz.dart';
import 'package:project/core/error/failure.dart';
import 'package:project/features/posts/domain/entities/todo.dart';

abstract class TodoRepository {
// we use future because the data is coming from api ..so we should wait a little bt until the data is ready
  Future<Either<Failure,List<TodoEntity>>> getAllTodos();

  Future<Either<Failure, Unit>> deletePost(int id);
  Future<Either<Failure, Unit>> updatePost(TodoEntity todoEntity);
  Future<Either<Failure, Unit>> addPost(TodoEntity todoEntity);

/* we use unit instead of void because as we say that Either return left anf right 
and our left should return nothing
return left(void); this is not true bz we cannot return void 
that why dart solve this issue and give us unit 
The Unit type in Dart serves as a representation of a value that carries no information. 
It's often used in functional programming to indicate the absence of a meaningful return value
*/
}
