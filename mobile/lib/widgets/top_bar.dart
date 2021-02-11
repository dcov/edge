import 'package:flutter/material.dart';

import 'context_extensions.dart';

const kTopBarHeight = 48.0;

class TopBar extends StatelessWidget {

  TopBar({
    Key key,
    this.leading,
    this.middle,
    this.trailing
  }) : super(key: key);

  final Widget leading;

  final Widget middle;

  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: context.mediaPaddingOnlyTop,
        child: SizedBox(
          height: kTopBarHeight,
          child: NavigationToolbar(
            leading: leading,
            middle: middle,
            trailing: trailing))));
  }
}

