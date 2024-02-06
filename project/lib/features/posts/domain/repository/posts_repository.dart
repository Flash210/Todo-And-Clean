import 'package:dartz/dartz.dart';
import 'package:project/core/error/failure.dart';
import 'package:project/features/posts/domain/entities/posts.dart';

abstract class PostsRepository {
// we use future because the data is coming from api ..so we should wait a little bt until the data is ready
  Future<Either<Failure, List<Post>>> getAllTodos();

  Future<Either<Failure, Unit>> deletePost(int id);
  Future<Either<Failure, Unit>> updatePost(Post todoEntity);
  Future<Either<Failure, Unit>> addPost(Post todoEntity);

/* we use unit instead of void because as we say that Either return left anf right 
and our left should return nothing
return left(void); this is not true bz we cannot return void 
that why dartz (ipmplenting functionl porgramming in OOP ) solve this issue and give us unit 
The Unit type in Dart serves as a representation of a value that carries no information. 
It's often used in functional programming to indicate the absence of a meaningful return value
*/

//!adhering to the dependency inversion principle, which states that high-level modules
//?should not depend on low-level modules but should depend on abstractions.
//?The implementation of these methods will be provided in the data layer, which will depend
//?  on the repository interface.
}
