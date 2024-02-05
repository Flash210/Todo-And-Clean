import 'package:dartz/dartz.dart';
import 'package:project/core/error/failure.dart';
import 'package:project/features/posts/domain/repository/posts_repository.dart';

import '../entities/posts.dart';

class GetAllPostsUseCase {
  final PostsRepository repository;

  GetAllPostsUseCase({required this.repository});

  Future<Either<Failure, List<Posts>>> call() async {
    return await repository.getAllTodos();
  }

/*
why we call our method call not getALl 
every class contain a call method not implementing 
*/
}
