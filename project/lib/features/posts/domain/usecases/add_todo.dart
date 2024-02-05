import 'package:dartz/dartz.dart';
import 'package:project/features/posts/domain/entities/posts.dart';
import 'package:project/features/posts/domain/repository/posts_repository.dart';

import '../../../../core/error/failure.dart';

class AddPostsUseCase {
  final PostsRepository repository;

  AddPostsUseCase({required this.repository});

  Future<Either<Failure, Unit>> call(Posts todoEntity) async {
    return await repository.addPost(todoEntity);
  }
}
