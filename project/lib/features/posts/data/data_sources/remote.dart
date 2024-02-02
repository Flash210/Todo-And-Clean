import 'package:dartz/dartz.dart';
import 'package:project/features/posts/data/models/todo.dart';

abstract class Remote {
  Future<List<TodoModel>> getAllTodos();
  Future<Unit> deletePost(int id);
  Future<Unit> updatePost(TodoModel todoModel);
  Future<Unit> addPost(TodoModel todoModel);
}

/*
this class is abract why ? 
class RemoteImplementWithHttp implemen Remote ..
if the http class does not work anymore we can create another one and 
implenet the abract class without generate the whole code again from zero 

class RemoteImplementWithDio implemen Remote ..
its a part of solid principal 

*/

class TodoRemoteDataSourceImpl implements Remote{
  @override
  Future<Unit> addPost(TodoModel todoModel) {
    // TODO: implement addPost
    throw UnimplementedError();
  }

  @override
  Future<Unit> deletePost(int id) {
    // TODO: implement deletePost
    throw UnimplementedError();
  }

  @override
  Future<List<TodoModel>> getAllTodos() {
    // TODO: implement getAllTodos
    throw UnimplementedError();
  }

  @override
  Future<Unit> updatePost(TodoModel todoModel) {
    // TODO: implement updatePost
    throw UnimplementedError();
  }

}

