import 'package:flutter/material.dart';

import 'context_extensions.dart';

class BottomBarItem {

  BottomBarItem({
    @required this.icon,
    @required this.onTap
  }) : assert(icon != null),
       assert(onTap != null);

  final IconData icon;

  final VoidCallback onTap;
}

class _BottomBarItemWidget extends StatefulWidget {

  _BottomBarItemWidget({
    Key key,
    @required this.item,
  }) : assert(item != null),
       super(key: key);

  final BottomBarItem item;

  @override
  _BottomBarItemWidgetState createState() => _BottomBarItemWidgetState();
}

class _BottomBarItemWidgetState extends State<_BottomBarItemWidget> {

  Color _iconColor;

  static const _kInactiveColor = Colors.grey;
  static const _kActiveColor = Colors.black;

  @override
  void initState() {
    super.initState();
    _iconColor = _kInactiveColor;
  }

  void _handleTapDown(TapDownDetails _) {
    setState(() {
      _iconColor = _kActiveColor;
    });
  }

  void _handleTap() {
    // Reset the color
    _handleTapCancel();
    widget.item.onTap();
  }

  void _handleTapCancel() {
    setState(() {
      _iconColor = _kInactiveColor;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapCancel: _handleTapCancel,
      onTap: _handleTap,
      child: Icon(
        widget.item.icon,
        color: _iconColor));
  }
}

const kBottomBarHeight = 48.0;

class BottomBar extends StatelessWidget {

  BottomBar({
    Key key,
    this.items = const <BottomBarItem>[],
  }) : assert(items != null),
       super(key: key);

  final List<BottomBarItem> items;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.mediaPaddingOnlyBottom,
      child: SizedBox(
        height: kBottomBarHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: items.map((BottomBarItem item) {
            return _BottomBarItemWidget(item: item);
          }).toList())));
  }
}
