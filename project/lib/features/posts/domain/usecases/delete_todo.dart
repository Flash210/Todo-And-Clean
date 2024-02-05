import 'package:dartz/dartz.dart';
import 'package:project/core/error/failure.dart';
import 'package:project/features/posts/domain/repository/posts_repository.dart';

class DeletePostUseCAse {
  final PostsRepository repository;

  DeletePostUseCAse({required this.repository});

  Future<Either<Failure, Unit>> call(int id) async {
    return await repository.deletePost(id);
  }
}
