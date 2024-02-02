


import 'package:equatable/equatable.dart';

class TodoEntity extends Equatable{


   final int? userId;
 final  int? id;
 final String? title;
 final bool? completed;

  const TodoEntity({ this.userId,  this.id,  this.title,  this.completed});
  
  @override
  // TODO: implement props
  List<Object?> get props { 
    return[
       userId,id,title,completed
  ];
  }


}