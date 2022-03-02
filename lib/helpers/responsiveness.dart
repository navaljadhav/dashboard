import 'package:flutter/material.dart';

const int largeScreenSize = 1366;
const int mediumScreenSize = 785;
const int smallScreenSize = 360;
const int custumScreenSize = 1100;

class ResponsiveWidget extends StatelessWidget {
  final Widget largeScreen;
  final Widget? mediumScreen;
  final Widget? smallScreen;
  final Widget? customScreen;

  const ResponsiveWidget({
    Key? key,
    required this.largeScreen,
    this.mediumScreen,
    this.smallScreen,
    this.customScreen,
  }) : super(key: key);

  static width(BuildContext context) => MediaQuery.of(context).size.width;

  static bool isSmallScreen(BuildContext context) =>
      width(context) < mediumScreenSize;

  static bool isMediumScreen(BuildContext context) =>
      width(context) >= mediumScreenSize && width(context) <= largeScreenSize;

  static bool isLargeScreen(BuildContext context) =>
      width(context) >= largeScreenSize;

  static bool isCustumScreen(BuildContext context) =>
      width(context) >= mediumScreenSize && width(context) <= custumScreenSize;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double _width = constraints.maxWidth;

        if (_width >= largeScreenSize) {
          return largeScreen;
        } else if (_width < largeScreenSize && _width >= mediumScreenSize) {
          return mediumScreen ?? largeScreen;
        } else {
          return smallScreen ?? largeScreen;
        }
      },
    );
  }
}
