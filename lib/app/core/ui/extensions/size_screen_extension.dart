import 'package:flutter/material.dart';

extension ScreenSize on BuildContext {
  double get width => MediaQuery.sizeOf(this).width;
  double get height => MediaQuery.sizeOf(this).height;

  double percentWidth(double percent) => width * percent;
  double percentHeight(double percent) => height * percent;

  bool get isMobile => (MediaQuery.sizeOf(this).width <= 480);
  bool get isTablet => (MediaQuery.sizeOf(this).width > 480);
  bool get isDesktop => (MediaQuery.sizeOf(this).width > 1200);
}
