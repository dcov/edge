import 'package:flutter/material.dart' hide BottomSheet;
import 'package:muex_flutter/muex_flutter.dart';

import '../models/app.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/bottom_sheet.dart';

import 'todos_controller.dart';

class MainScreen extends StatefulWidget {

  MainScreen({
    Key key,
    @required this.app
  }) : assert(app != null),
       super(key: key);

  final App app;

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin {

  AnimationController _bottomSheetController;

  @override
  void initState() {
    super.initState();
    _bottomSheetController = AnimationController(
      duration: const Duration(milliseconds: 300),
      lowerBound: 0.0,
      upperBound: 1.0,
      value: 0.0,
      vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: <Widget>[
          Material(
            child: SizedBox.expand()),
          BottomSheet(
            handleHeight: kBottomBarHeight,
            controller: _bottomSheetController,
            child: _TodosBottomSheetBody(
              bottomSheetAnimation: _bottomSheetController))
        ]));
  }
}

class _TodosBottomSheetBody extends StatelessWidget {

  _TodosBottomSheetBody({
    Key key,
    @required this.bottomSheetAnimation,
  }) : super(key: key);

  final Animation<double> bottomSheetAnimation;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4.0,
      borderRadius: const BorderRadius.vertical(top: Radius.circular(16.0)),
      child: Stack(
        children: <Widget>[
          ValueListenableBuilder(
            valueListenable: bottomSheetAnimation,
            builder: (BuildContext context, double value, Widget child) {
              return Opacity(
                opacity: 1.0 - value,
                child: IgnorePointer(
                  ignoring: value != 0.0,
                  child: child));
            },
            child: BottomBar(
              items: <BottomBarItem>[
                BottomBarItem(
                  icon: Icons.list,
                  onTap: () {
                  }),
                BottomBarItem(
                  icon: Icons.add,
                  onTap: () {
                  })
              ])),
          ValueListenableBuilder(
            valueListenable: bottomSheetAnimation,
            builder: (BuildContext context, double value, Widget child) {
              return Opacity(
                opacity: value,
                child: IgnorePointer(
                  ignoring: value == 0.0,
                  child: child));
            },
            child: CustomScrollView(
              slivers: <Widget>[

              ]))
        ]));
  }
}
