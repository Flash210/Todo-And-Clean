import 'package:equatable/equatable.dart';

class Post extends Equatable {
  /*
   ? Equatable is a Dart package that makes it easier to compare objects in Dart by overriding the == operator
  ? and implementing the hashCode property.
   */
  final int? userId;
  final int? id;
  final String? title;
  final bool? completed;

  const Post({this.userId, this.id, this.title, this.completed});

  //!props getter method is overridden to specify the properties of the Posts class that should be considered
  //! when comparing two instances of Posts for equality.

  @override
  List<Object?> get props {
    //!List<Object?> get props { ... }: This is the getter method that returns a list of the properties of the class that should be used
    //!for equality comparison. It returns a list containing the userId, id, title, and completed properties of the Posts class.
    return [userId, id, title, completed];
  }
}
