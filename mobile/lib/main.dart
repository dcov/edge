import 'package:muex_flutter/muex_flutter.dart';

import 'logic/init.dart';
import 'views/init_view.dart';

void main() {
  runLoop(
    initial: InitApp(),
    view: InitView());
}

