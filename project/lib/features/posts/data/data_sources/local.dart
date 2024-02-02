import 'package:dartz/dartz.dart';
import 'package:project/features/posts/data/models/todo.dart';

abstract class Local {


  Future<List<TodoModel>> getCashedPosts();
 Future<Unit> casheTodos(List<TodoModel> todoModel);
}

class TodoLocalDataSourceImpl implements Local{
  @override
  Future<Unit> casheTodos(List<TodoModel> todoModel) {
    // TODO: implement casheTodos
    throw UnimplementedError();
  }

  @override
  Future<List<TodoModel>> getCashedPosts() {
    // TODO: implement getCashedPosts
    throw UnimplementedError();
  }

  
}