// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// ModelGenerator
// **************************************************************************

class _$Todo implements Todo {
  _$Todo({
    String title,
    String description,
  }) {
    this._title = title;
    this._description = description;
  }
  String get title {
    ModelContext.instance.didGet(this, (diff) => diff.title = true);
    return _title;
  }

  String _title;
  set title(String value) {
    ModelContext.instance.debugEnsureUpdate();
    if (value != _title) {
      _title = value;
      ModelContext.instance.didUpdate(this, (diff) => diff.title = true);
    }
  }

  String get description {
    ModelContext.instance.didGet(this, (diff) => diff.description = true);
    return _description;
  }

  String _description;
  set description(String value) {
    ModelContext.instance.debugEnsureUpdate();
    if (value != _description) {
      _description = value;
      ModelContext.instance.didUpdate(this, (diff) => diff.description = true);
    }
  }

  @override
  __$TodoDiff createDiff() => __$TodoDiff();
}

class __$TodoDiff implements Diff {
  bool title = false;
  bool description = false;
  @override
  bool compare(__$TodoDiff other) {
    return (this.title && other.title) ||
        (this.description && other.description);
  }
}
