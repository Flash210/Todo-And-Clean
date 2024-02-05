import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:project/core/network/network_info.dart';
import 'package:project/features/posts/data/data_sources/local.dart';
import 'package:project/features/posts/data/data_sources/remote.dart';
import 'package:project/features/posts/data/repository/todo_repository_impl.dart';
import 'package:project/features/posts/domain/repository/todo_repository.dart';
import 'package:project/features/posts/domain/usecases/add_todo.dart';
import 'package:project/features/posts/domain/usecases/delete_todo.dart';
import 'package:project/features/posts/domain/usecases/get_all_todos.dart';
import 'package:project/features/posts/domain/usecases/update_todo.dart';
import 'package:project/features/posts/presentation/bloc/crud/crud_bloc.dart';
import 'package:project/features/posts/presentation/bloc/posts/posts_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

final injection = GetIt.instance;

Future<void> init() async {
//!Features
  //bloc
  // factory is a design pattern

  injection.registerFactory(() => PostsBloc(injection()));
  injection.registerFactory(() => CrudBloc(
      addPostUseCase: injection(),
      deletePostUseCase: injection(),
      updatePostUseCase: injection()));

  //uses cases here and repo and the data sorces we need only one objet  to reuse it called singelton
  injection
      .registerLazySingleton(() => GetAllPostsUseCase(repository: injection()));
  injection
      .registerLazySingleton(() => AddPostsUseCase(repository: injection()));
  injection
      .registerLazySingleton(() => DeletePostUseCAse(repository: injection()));
  injection
      .registerLazySingleton(() => UpdatePostsUseCase(repository: injection()));

  //rpeository
  injection.registerLazySingleton(() => PostsReposiotryImpl(
      remoteDataSource: injection(),
      localDataSource: injection(),
      networkInfo: injection()));

  //data sources
  injection.registerLazySingleton(
      () => PostRemoteDataSourceImpl(client: injection()));
  injection.registerLazySingleton(
      () => PostLocalDataSourceImpl(sharedPreferences: injection()));

  //!Core
  injection
      .registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(injection()));

  //! externel
  final sharedPrefences = await SharedPreferences.getInstance();
  injection.registerLazySingleton(() => sharedPrefences);

  injection.registerLazySingleton(() => http.Client());


  injection.registerLazySingleton(() => InternetConnectionChecker());
}
