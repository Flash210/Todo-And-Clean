


import 'package:dartz/dartz.dart';
import 'package:project/core/error/failure.dart';
import 'package:project/features/posts/data/data_sources/local.dart';
import 'package:project/features/posts/data/data_sources/remote.dart';
import 'package:project/features/posts/domain/entities/todo.dart';
import 'package:project/features/posts/domain/repository/todo_repository.dart';

class TodoReposiotryUmpl implements TodoRepository{

final Remote remoteDataSource;
final Local localDataSource;

  TodoReposiotryUmpl(this.remoteDataSource, this.localDataSource);

  @override
  Future<Either<Failure, Unit>> addPost(TodoEntity todoEntity) {
    // TODO: implement addPost
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> deletePost(int id) {
    // TODO: implement deletePost
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<TodoEntity>>> getAllTodos()async {
   
   return await remoteDataSource.getAllTodos();
  }

  @override
  Future<Either<Failure, Unit>> updatePost(TodoEntity todoEntity) {
    // TODO: implement updatePost
    throw UnimplementedError();
  }

}