import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:project/core/error/exception.dart';
import 'package:project/features/posts/data/models/todo.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class Local {
  Future<List<TodoModel>> getCashedPosts();
  Future<Unit> casheTodos(List<TodoModel> todoModel);
}

class TodoLocalDataSourceImpl implements Local {
  final SharedPreferences sharedPreferences;

  TodoLocalDataSourceImpl(this.sharedPreferences);

  @override
  Future<Unit> casheTodos(List<TodoModel> todoModel) {
    List todoModelToJson =
        todoModel.map<Map<String, dynamic>>((todo) => todo.toJson()).toList();
        sharedPreferences.setString("CACHED",json.encode(todoModelToJson) );

        return Future.value(unit);
  }

  @override
  Future<List<TodoModel>> getCashedPosts() {
        
        final jsonString =sharedPreferences.getString("CACHED");

        if ( jsonString != null){
          List decodeJsonData=json.decode(jsonString);
          List<TodoModel> jsonToTodoModels=decodeJsonData
          .map<TodoModel>((jsonPostModel) => TodoModel.fromJson(jsonPostModel)).toList();

          return Future.value(jsonToTodoModels);
        }else 
        throw EmptyCasheExpetion();



  }
}
