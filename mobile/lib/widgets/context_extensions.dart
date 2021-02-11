import 'package:flutter/material.dart';

extension MediaQueryPaddingExtension on BuildContext {

  EdgeInsets get mediaPadding => MediaQuery.of(this).padding;

  EdgeInsets get mediaPaddingOnlyTop => EdgeInsets.only(top: mediaPadding.top);

  EdgeInsets get mediaPaddingOnlyBottom => EdgeInsets.only(bottom: mediaPadding.bottom);
}

