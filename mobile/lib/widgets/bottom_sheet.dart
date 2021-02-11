import 'package:custom_render_object_widget/custom_render_object_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class BottomSheet extends StatefulWidget {

  BottomSheet({
    Key key,
    @required this.handleHeight,
    @required this.controller,
    @required this.child,
  }) : assert(handleHeight != null),
       assert(controller != null &&
              controller.lowerBound == 0.0 &&
              controller.upperBound == 1.0),
       assert(child!= null),
       super(key: key);

  final double handleHeight;

  final AnimationController controller;

  final Widget child;

  @override
  BottomSheetState createState() => BottomSheetState();
}

class BottomSheetState extends State<BottomSheet> {

  AnimationController get _controller => widget.controller;

  double _draggableExtent;

  void _handleDraggableExtent(double value) {
    _draggableExtent = value;
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    _controller.value -= details.primaryDelta / _draggableExtent;
  }

  void _handleDragEnd(DragEndDetails details) {
    if (details.primaryVelocity.abs() >= 700) {
      _controller.fling(velocity: -details.primaryVelocity / _draggableExtent);
    } else if (_controller.value >= 0.5) {
      _controller.fling(velocity: 1.0);
    } else {
      _controller.fling(velocity: -1.0);
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return _BottomSheetLayout(
      handleHeight: widget.handleHeight,
      animation: _controller,
      onDraggableExtent: _handleDraggableExtent,
      handle: GestureDetector(
        onVerticalDragUpdate: _handleDragUpdate,
        onVerticalDragEnd: _handleDragEnd,
        dragStartBehavior: DragStartBehavior.start,
        behavior: HitTestBehavior.translucent),
      body: widget.child);
  }
}

enum _BottomSheetLayoutSlot {
  handle,
  body
}

class _BottomSheetLayout extends CustomRenderObjectWidget {

  _BottomSheetLayout({
    Key key,
    @required this.handleHeight,
    @required this.animation,
    @required this.onDraggableExtent,
    @required Widget handle,
    @required Widget body
  }) : assert(handleHeight != null),
       assert(animation != null),
       assert(onDraggableExtent != null),
       assert(handle != null),
       assert(body != null),
       super(
         key: key,
         children: <dynamic, Widget> {
           _BottomSheetLayoutSlot.handle : handle,
           _BottomSheetLayoutSlot.body : body
         });
  
  final double handleHeight;

  final Animation<double> animation;

  final ValueChanged<double> onDraggableExtent;

  @override
  _RenderBottomSheetLayout createRenderObject(BuildContext _) {
    return _RenderBottomSheetLayout(
      handleHeight: this.handleHeight,
      animation: this.animation,
      onDraggableExtent: this.onDraggableExtent);
  }

  @override
  void updateRenderObject(BuildContext _, _RenderBottomSheetLayout renderObject) {
    renderObject..handleHeight = this.handleHeight
                ..animation = this.animation
                ..onDraggableExtent = this.onDraggableExtent;
  }
}

class _RenderBottomSheetLayout extends RenderBox
    with CustomRenderObjectMixin<RenderBox>, CustomRenderBoxDefaultsMixin {

  _RenderBottomSheetLayout({
    double handleHeight,
    Animation<double> animation,
    ValueChanged<double> onDraggableExtent
  }) : assert(handleHeight != null),
       assert(animation != null),
       assert(onDraggableExtent != null),
       _handleHeight = handleHeight,
       _animation = animation,
       _onDraggableExtent = onDraggableExtent;

  double _handleHeight;
  set handleHeight(double value) {
    assert(value != null);
    if (value == _handleHeight)
      return;
    _handleHeight = value;
    markNeedsLayout();
  }

  Animation<double> _animation;
  set animation(Animation<double> value) {
    assert(value != null);
    if (value == _animation)
      return;
    if (_animation != null)
      _animation.removeListener(markNeedsLayout);
    _animation = value;
    if (attached)
      _animation.addListener(markNeedsLayout);
    markNeedsLayout();
  }

  double get _draggableExtent {
    assert(size != null);
    return size.height - _handleHeight;
  }

  ValueChanged<double> _onDraggableExtent;
  set onDraggableExtent(ValueChanged<double> value) {
    assert(value != null);
    _onDraggableExtent = value;
    if (size != null)
      _onDraggableExtent(_draggableExtent);
  }

  @override
  void attach(PipelineOwner owner) {
    super.attach(owner);
    _animation.addListener(markNeedsLayout);
  }

  @override
  void detach() {
    _animation.removeListener(markNeedsLayout);
    super.detach();
  }

  @override
  bool get sizedByParent => true;

  @override
  void performResize() {
    assert(constraints.hasBoundedWidth && constraints.hasBoundedHeight);
    size = constraints.biggest;
    _onDraggableExtent(_draggableExtent);
  }

  @override
  List<dynamic> get hitTestOrdering {
    return const <dynamic>[
      _BottomSheetLayoutSlot.handle,
      _BottomSheetLayoutSlot.body
    ];
  }

  @override
  void performLayout() {
    layoutChild(
      _BottomSheetLayoutSlot.handle,
      BoxConstraints.tight(Size(size.width, _handleHeight)));

    layoutChild(
      _BottomSheetLayoutSlot.body,
      BoxConstraints.tight(Size(size.width, size.height)));

    final startY = size.height - _handleHeight;
    final currentY = startY - (startY * _animation.value);

    positionChild(
      _BottomSheetLayoutSlot.handle,
      Offset(
        0.0,
        currentY));

    positionChild(
      _BottomSheetLayoutSlot.body,
      Offset(
        0.0,
        currentY));
  }
}
