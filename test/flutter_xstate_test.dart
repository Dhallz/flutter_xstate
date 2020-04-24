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

  // REVIEW Group test
  group("XStateManager class testing", () {
    XStateModel _xStateModel = XStateModel(
      xStateModelName: "profileOne",
      isVisible: true,
      isEnable: true,
      onPressed: () {},
    );
    test('Add XStateModel to XStateManager list.', () {
      int actualListLength = _xStateManager.xStateModelMap.length;
      expect(actualListLength, actualListLength);

      _xStateManager.addModel(
        XStateModel(
          xStateModelName: "profileOne",
          isVisible: true,
          isEnable: true,
          onPressed: () {},
        ),
      );

      expect(actualListLength, actualListLength++);

      actualListLength = _xStateManager.xStateModelMap.length;
      _xStateManager.addModel(
        XStateModel(
          xStateModelName: "profileTwo",
          isVisible: true,
          isEnable: true,
          onPressed: () {},
        ),
      );

      expect(actualListLength, actualListLength++);
    });

    test('Update XStateModel from XStateManager.', () {
      expect(_xStateManager.xStateModelMap["profileOne"].isEnable, true);
      _xStateManager.updateModel(
        XStateModel(
          xStateModelName: "profileOne",
          isVisible: false,
          isEnable: false,
        ),
      );
      expect(_xStateManager.xStateModelMap["profileOne"].isEnable, false);
      expect(_xStateManager.xStateModelMap["profileOne"].test, null);
      _xStateManager.updateModel(
        XStateModel(
          xStateModelName: "profileOne",
          isVisible: false,
          isEnable: true,
          test: "ok",
        ),
      );
      expect(_xStateManager.xStateModelMap["profileOne"].isEnable, true);
      expect(_xStateManager.xStateModelMap["profileOne"].test, "ok");
    });

    test('Remove XStateModel from XStateManager.', () {
      _xStateManager.addModel(
        XStateModel(
          xStateModelName: "profileOne",
          isVisible: true,
          isEnable: true,
          onPressed: () {},
        ),
      );
      expect(_xStateManager.xStateModelMap.containsKey("profileOne"), true);
      _xStateManager.removeModel("profileOne");
      expect(_xStateManager.xStateModelMap.containsKey("profileOne"), false);
    });

    test('Get XStateModel from XStateManager.', () {
      _xStateManager.addModel(
        XStateModel(
          xStateModelName: "profileOne",
          isVisible: true,
          isEnable: true,
          onPressed: () {},
        ),
      );
      _xStateModel = _xStateManager.getModel("profileOne");
      expect(_xStateModel.xStateModelName, "profileOne");
    });
  });

  group("XStateWidget Widget testing", () {
    XStateModel _xStateModel = XStateModel(
        xStateModelName: "profileOne",
        isVisible: true,
        isEnable: true,
        onPressed: () {});
    FloatingActionButton _floatingActionButton =
        new FloatingActionButton(onPressed: () {});
    testWidgets('Get widget and return one whith the model rules.',
        (WidgetTester tester) async {
      Widget _xStateDummy = XStateDummy(
        _floatingActionButton,
        _xStateModel,
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
