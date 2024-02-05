part of 'crud_bloc.dart';

abstract class CrudState extends Equatable {
  const CrudState();

  @override
  List<Object> get props => [];
}

class CrudInitial extends CrudState{}

class AddPostState extends CrudState {}

class LoadingState extends CrudState {}

class ErorrState extends CrudState {
  final String message;

  ErorrState({required this.message});

  @override
  List<Object> get props => [message];
}

class SuccesCrud extends CrudState {
  final String message;

  SuccesCrud({required this.message});

   @override
  List<Object> get props => [message];
}
