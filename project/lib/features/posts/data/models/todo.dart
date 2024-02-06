import 'package:project/features/posts/domain/entities/posts.dart';

class TodoModel extends Post {
  //?Representation of JSON structure that allows us to interact with our data sources.
  const TodoModel({
    int? userId,
    int? id,
    String? title,
    bool? completed,
  }) : super(userId: userId, id: id, title: title, completed: completed);

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      userId: json['userId'] ?? "",
      id: json['id'] ?? "",
      title: json['title'] ?? "",
      completed: json['completed'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {'userId': userId, 'id': id, 'title': title, 'completed': completed};
  }
}
