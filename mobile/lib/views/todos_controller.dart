import 'package:flutter/material.dart';

import '../models/app.dart';
import '../models/todo.dart';

class TodosController extends StatefulWidget {

  TodosController({
    Key key,
    @required this.app
  }) : assert(app != null),
       super(key: key);

  final App app;

  @override
  _TodosControllerState createState() => _TodosControllerState();
}

class _TodosControllerState extends State<TodosController> {
  
  @override
  Widget build(BuildContext context) {
  }
}

