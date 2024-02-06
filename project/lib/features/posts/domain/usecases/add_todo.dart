import 'package:dartz/dartz.dart';
import 'package:project/features/posts/domain/entities/posts.dart';
import 'package:project/features/posts/domain/repository/posts_repository.dart';

import '../../../../core/error/failure.dart';

class AddPostsUseCase {
  final PostsRepository repository;

  AddPostsUseCase({required this.repository});

  Future<Either<Failure, Unit>> call(Post todoEntity) async {
    return await repository.addPost(todoEntity);
  }
}

//*The domain layer would be written purely in Dart without any Flutter elements. 
//*The reason is that the domain should only be concerned with the business logic of the application,
//* not with the implementation details. This also allows for easy migration between platforms,
//* should any issues arise.

/*
Use Cases: Application-specific business rules
Entities: Business objects of the application
Repositories: Abstract classes that define the expected functionality of outer layers
*/