// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app.dart';

// **************************************************************************
// ModelGenerator
// **************************************************************************

class _$App implements App {
  _$App({
    List<Todo> availableTodos = const [],
    List<Todo> completedTodos = const [],
  }) {
    if (availableTodos != null) {
      this._availableTodos = ModelList<Todo>(
          _availableTodosInnerGet, _availableTodosInnerUpdate, availableTodos);
    }
    if (completedTodos != null) {
      this._completedTodos = ModelList<Todo>(
          _completedTodosInnerGet, _completedTodosInnerUpdate, completedTodos);
    }
  }
  List<Todo> get availableTodos => _availableTodos;
  ModelList<Todo> _availableTodos;
  void _availableTodosInnerGet() {
    ModelContext.instance
        .didGet(this, (diff) => diff.availableTodosInner = true);
  }

  void _availableTodosInnerUpdate() {
    ModelContext.instance.debugEnsureUpdate();
    ModelContext.instance
        .didUpdate(this, (diff) => diff.availableTodosInner = true);
  }

  List<Todo> get completedTodos => _completedTodos;
  ModelList<Todo> _completedTodos;
  void _completedTodosInnerGet() {
    ModelContext.instance
        .didGet(this, (diff) => diff.completedTodosInner = true);
  }

  void _completedTodosInnerUpdate() {
    ModelContext.instance.debugEnsureUpdate();
    ModelContext.instance
        .didUpdate(this, (diff) => diff.completedTodosInner = true);
  }

  @override
  __$AppDiff createDiff() => __$AppDiff();
}

class __$AppDiff implements Diff {
  bool availableTodosInner = false;
  bool completedTodosInner = false;
  @override
  bool compare(__$AppDiff other) {
    return (this.availableTodosInner && other.availableTodosInner) ||
        (this.completedTodosInner && other.completedTodosInner);
  }
}
