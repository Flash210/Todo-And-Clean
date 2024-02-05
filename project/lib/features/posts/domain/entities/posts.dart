import 'package:equatable/equatable.dart';

class Posts extends Equatable {
  final int? userId;
  final int? id;
  final String? title;
  final bool? completed;

  const Posts({this.userId, this.id, this.title, this.completed});

  @override
  // TODO: implement props
  List<Object?> get props {
    return [userId, id, title, completed];
  }
}
