import 'package:flutter/foundation.dart';

class XStateModel {
  // XStateModel base variables.
  final String xStateModelName;
  final bool isVisible;
  final bool isEnable;
  // XStateModel supported widgets variables.
  final Function onPressed;
  final Function onSaved;
  final String test;

  XStateModel({
    @required this.xStateModelName,
    @required this.isVisible,
    @required this.isEnable,
    this.onPressed,
    this.onSaved,
    this.test,
  });
}
