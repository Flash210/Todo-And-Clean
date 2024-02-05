part of 'crud_bloc.dart';

abstract class CrudEvent extends Equatable {
  const CrudEvent();

  @override
  List<Object> get props => [];
}

class AddPostEvent extends CrudEvent {
  final Posts post;

  AddPostEvent(this.post);

  @override
  List<Object> get props => [post];
}

class UpdatePostEvent extends CrudEvent {
  final Posts post;

  UpdatePostEvent(this.post);

  @override
  List<Object> get props => [post];
}

class DeletePostEvent extends CrudEvent {
  final int postId;

  DeletePostEvent(this.postId);

  @override
  List<Object> get props => [postId];
}
