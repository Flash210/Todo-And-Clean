import 'package:project/features/posts/domain/entities/todo.dart';

class TodoModel  extends TodoEntity{
 
 const TodoModel({
    int ? userId,
    int ? id,
    String ? title,
    bool ? completed,
   
  }): super(
    userId: userId,
    id: id,
    title: title,
    completed: completed
   
  );


  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      userId: json['userId'] ?? "",

      id: json['id'] ?? "",

      title: json['title'] ?? "",

      completed: json['completed'] ?? "",

    );
  }

  Map<String, dynamic> toJson(){
    return {
      'userId':userId,
      'id':id,
      'title':title,
      'completed':completed

    };
  }


}