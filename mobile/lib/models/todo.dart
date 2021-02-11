import 'package:muex/muex.dart';

part 'todo.g.dart';

abstract class Todo implements Model {

  factory Todo({
    String title,
    String description
  }) = _$Todo;

  String title;

  String description;
}
