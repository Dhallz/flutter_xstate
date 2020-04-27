import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_xstate/flutter_xstate.dart';
import 'package:flutter_xstate/flutter_xstate_manager.dart';
import 'package:flutter_xstate/flutter_xstate_model.dart';

void main() {
  Widget _makeTestableWidget({Widget child}) {
    return MaterialApp(
      home: child,
    );
  }

  XStateManager _xStateManager = XStateManager();
  group("[XState] Widget testing", () {
    _xStateManager.addModel(XStateModel(
        xStateModelName: "profileOne",
        isVisible: true,
        isEnable: true,
        onPressed: () {}));
    XStateModel _xStateModel = _xStateManager.getModel("profileOne");
    FloatingActionButton _floatingActionButton =
        new FloatingActionButton(onPressed: () {});
    testWidgets('[XState] Get widget and return one whith the model rules.',
        (WidgetTester tester) async {
      Widget _xStateDummy = XStateDummy(
        child: _floatingActionButton,
        model :_xStateModel,
      );
      var widget;

      await tester.pumpWidget(_makeTestableWidget(child: _xStateDummy));

      if (_xStateModel.isVisible) {
        widget = find.byType(FloatingActionButton);
        expect(widget, findsOneWidget);
      } else {
        widget = find.byType(Container);
        expect(widget, findsOneWidget);
      }
    });
  });
}
