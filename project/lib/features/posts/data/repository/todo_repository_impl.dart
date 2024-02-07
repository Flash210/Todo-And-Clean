import 'package:dartz/dartz.dart';
import 'package:project/core/error/exception.dart';
import 'package:project/core/error/failure.dart';
import 'package:project/core/network/network_info.dart';
import 'package:project/features/posts/data/data_sources/local.dart';
import 'package:project/features/posts/data/data_sources/remote.dart';
import 'package:project/features/posts/data/models/todo.dart';
import 'package:project/features/posts/domain/entities/posts.dart';
import 'package:project/features/posts/domain/repository/posts_repository.dart';

typedef Future<Unit> DeleteOrUpdateOrAdd();

class PostsReposiotryImpl implements PostsRepository {
  //? Actual implementations of the repositories in the Domain layer. Repositories are responsible
  //?to coordinate data from the different Data Sources.

  final Remote remoteDataSource;
  final Local localDataSource;
  final NetworkInfo networkInfo;

  PostsReposiotryImpl(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, Unit>> addPost(Post todoEntity) async {
    final TodoModel todoModel = TodoModel(
        //id: todoEntity.id,// delete it will cuase an error
        title: todoEntity.title,
        completed: todoEntity.completed);

    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.addPost(todoModel);
        return const Right(unit);
      } on ServerExpetion {
        return Left(ServerFailure());
      }
    } else {
      return Left(OffLineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> deletePost(int id) async {
    return await getMessage(() {
      return remoteDataSource.deletePost(id);
    });
  }

  @override
  Future<Either<Failure, List<Post>>> getAllTodos() async {
    if (await networkInfo.isConnected) //await because its future
    {
      try {
        final remoteTodo = await remoteDataSource.getAllTodos();
        localDataSource.casheTodos(remoteTodo);
        return Right(remoteTodo);
      } on ServerExpetion {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localTodo = await localDataSource.getCashedPosts();
        return Right(localTodo);
      } on EmptyCasheExpetion {
        return Left(EmptyCasheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> updatePost(Post todoEntity) async {
    final TodoModel todoModel = TodoModel(
        id: todoEntity.id,
        title: todoEntity.title,
        completed: todoEntity.completed);

    return await getMessage(() {
      return remoteDataSource.addPost(todoModel);
    });
  }

  Future<Either<Failure, Unit>> getMessage(
      DeleteOrUpdateOrAdd deleteOrUpdateOrAdd) async {
    if (await networkInfo.isConnected) {
      try {
        await deleteOrUpdateOrAdd();
        return const Right(unit);
      } on ServerExpetion {
        return Left(ServerFailure());
      }
    } else {
      return Left(OffLineFailure());
    }
  }
}
