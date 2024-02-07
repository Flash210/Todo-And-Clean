part of 'crud_bloc.dart';

abstract class CrudState extends Equatable {
  const CrudState();

  @override
  List<Object> get props => [];
}

class CrudInitial extends CrudState {}
class LoadingState extends CrudState {}


class AddPostState extends CrudState {}


class ErrorCrudState extends CrudState {
  final String message;

   ErrorCrudState({required this.message});

  @override
  List<Object> get props => [message];
}

class SuccesCrudState extends CrudState {
  final String message;

  const SuccesCrudState({required this.message});

  @override
  List<Object> get props => [message];
}
