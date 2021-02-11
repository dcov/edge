import 'package:flutter/material.dart';
import 'package:muex_flutter/muex_flutter.dart';

import 'main_screen.dart';

class InitView extends StatelessWidget {

  InitView({
    Key key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(
        app: context.state));
  }
}
