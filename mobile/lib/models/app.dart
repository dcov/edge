import 'package:muex/muex.dart';

import 'todo.dart';

part 'app.g.dart';

abstract class App implements Model {

  factory App({
    List<Todo> availableTodos = const <Todo>[],
    List<Todo> completedTodos = const <Todo>[],
  }) {
    return _$App(
      availableTodos: availableTodos,
      completedTodos: completedTodos
    );
  }

  List<Todo> get availableTodos;

  List<Todo> get completedTodos;
}
