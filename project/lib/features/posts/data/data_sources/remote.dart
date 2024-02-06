import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:project/core/constants/constants.dart';
import 'package:project/core/error/exception.dart';
import 'package:project/features/posts/data/models/todo.dart';
import 'package:http/http.dart' as http;
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


/*
Data sources: Consist of remote and local Data Sources. Remote Data Source will perform 
HTTP requests on the API. 
While local Data Source will cache or persist data.
*/
class PostRemoteDataSourceImpl implements Remote{


final http.Client client;

  PostRemoteDataSourceImpl({required this.client});

  @override
  Future<Unit> addPost(TodoModel todoModel) async{
 
   final body={
    "title":todoModel.title,
    "completed":todoModel.completed
   };

   final response=await client.post(Uri.parse("$todoApiBaseUrl/posts/"),body:body);

//response for succes create is 201
   if ( response.statusCode==201){
    return Future.value(unit);
   }else 
   {
    throw ServerExpetion();

   }
     



  }

  @override
  Future<Unit> deletePost(int id) async{
   
   final response= await client.delete(Uri.parse("$todoApiBaseUrl/posts/${id.toString()}"),
   headers: {"Content-Type":"application/json"}
   );

   if ( response.statusCode==200){
    return Future.value(unit);
   }else 
   {
    throw ServerExpetion();
   }

  }

  @override
  Future<List<TodoModel>> getAllTodos() async {
   
final response=await client.get(Uri.parse("$todoApiBaseUrl/todos/"),
headers: {"Content-Type":"application/json"},);

if (response.statusCode==200){
  final List decodedJson=json.decode(response.body) as List;
  final List<TodoModel> todoModels=
  decodedJson.map<TodoModel>((jsonTodo) => TodoModel.fromJson(jsonTodo)).toList();
  return todoModels;
}else {
  throw ServerExpetion();
}
  }

  @override
  Future<Unit> updatePost(TodoModel todoModel)async {
  

final id=todoModel.id.toString();
final body={
  "title":todoModel.title,
  "body":todoModel.completed
};

final response=await client.patch(Uri.parse("$todoApiBaseUrl/post/$id"),body: body);


if ( response.statusCode==200){
  return Future.value(unit);
}else{
  throw ServerExpetion();
}
  }

}

