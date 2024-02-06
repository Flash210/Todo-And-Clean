import 'package:dartz/dartz.dart';
import 'package:project/core/error/failure.dart';
import 'package:project/features/posts/domain/entities/posts.dart';
import 'package:project/features/posts/domain/repository/posts_repository.dart';

class UpdatePostsUseCase {
  final PostsRepository repository;

  UpdatePostsUseCase({required this.repository});

  Future<Either<Failure, Unit>> call(Post todoEntity) async {
    return await repository.updatePost(todoEntity);
  }
}
