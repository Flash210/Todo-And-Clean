import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:project/core/network/network_info.dart';
import 'package:project/features/posts/data/data_sources/local.dart';
import 'package:project/features/posts/data/data_sources/remote.dart';
import 'package:project/features/posts/data/repository/todo_repository_impl.dart';
import 'package:project/features/posts/domain/repository/posts_repository.dart';
import 'package:project/features/posts/domain/usecases/add_todo.dart';
import 'package:project/features/posts/domain/usecases/delete_todo.dart';
import 'package:project/features/posts/domain/usecases/get_all_todos.dart';
import 'package:project/features/posts/domain/usecases/update_todo.dart';
import 'package:project/features/posts/presentation/bloc/crud/crud_bloc.dart';
import 'package:project/features/posts/presentation/bloc/posts/posts_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

final  sl = GetIt.instance;

Future<void> init() async {
//!Features
  //bloc
  // factory is a design pattern

  sl.registerFactory(() => PostsBloc(sl()));
  sl.registerFactory(() => CrudBloc(
      addPostUseCase: sl(), deletePostUseCase: sl(), updatePostUseCase: sl()));

  //uses cases here and repo and the data sorces we need only one objet  to reuse it called singelton
  sl.registerLazySingleton(() => GetAllPostsUseCase(repository: sl()));
  sl.registerLazySingleton(() => AddPostsUseCase(repository: sl()));
  sl.registerLazySingleton(() => DeletePostUseCAse(repository: sl()));
  sl.registerLazySingleton(() => UpdatePostsUseCase(repository: sl()));

  //rpeository
  sl.registerLazySingleton<PostsRepository>(() => PostsReposiotryImpl(
      remoteDataSource: sl(), localDataSource: sl(), networkInfo: sl()));

  //data sources
  sl.registerLazySingleton<Remote>(() => PostRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<Local>(
      () => PostLocalDataSourceImpl(sharedPreferences: sl()));

  //!Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! externel
  final sharedPrefences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPrefences);

  sl.registerLazySingleton(() => http.Client());

  sl.registerLazySingleton(() => InternetConnectionChecker());
}
