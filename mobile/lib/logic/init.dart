import 'package:muex/muex.dart';

import '../models/app.dart';

class InitApp implements Initial {

  InitApp();

  @override
  Init init() {
    return Init(
      state: App(),
      then: Then.done());
  }
}

