import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CustomScrollBehavior extends MaterialScrollBehavior {
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.mouse,
        PointerDeviceKind.touch,
        PointerDeviceKind.trackpad
      };
}
