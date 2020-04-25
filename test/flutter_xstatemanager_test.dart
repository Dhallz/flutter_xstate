import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_xstate/flutter_xstate_manager.dart';
import 'package:flutter_xstate/flutter_xstate_model.dart';

void main() {
  XStateManager _xStateManager = XStateManager();

  // REVIEW Group test
  group("[XStateManager] class testing", () {
    XStateModel _xStateModel = XStateModel(
      xStateModelName: "profileOne",
      isVisible: true,
      isEnable: true,
      onPressed: () {},
    );
    test('[XStateManager] Add XStateModel to XStateManager list.', () {
      expect(_xStateManager.xStateModelMap.containsKey("profileOne"), false);
      expect(_xStateManager.xStateModelMap.containsKey("profileTwo"), false);

      _xStateManager.addModel(
        XStateModel(
          xStateModelName: "profileOne",
          isVisible: true,
          isEnable: true,
          onPressed: () {},
        ),
      );

      expect(_xStateManager.xStateModelMap.containsKey("profileOne"), true);
      expect(_xStateManager.xStateModelMap.containsKey("profileTwo"), false);

      _xStateManager.addModel(
        XStateModel(
          xStateModelName: "profileTwo",
          isVisible: true,
          isEnable: true,
          onPressed: () {},
        ),
      );

      expect(_xStateManager.xStateModelMap.containsKey("profileOne"), true);
      expect(_xStateManager.xStateModelMap.containsKey("profileTwo"), true);
    });

    test('[XStateManager] Update XStateModel from XStateManager.', () {
      expect(_xStateManager.xStateModelMap.containsKey("profileOne"), true);
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

    test('[XStateManager] Remove XStateModel from XStateManager.', () {
      _xStateManager.addModel(
        XStateModel(
          xStateModelName: "profileOne",
          isVisible: true,
          isEnable: true,
          onPressed: () {},
        ),
      );
      expect(_xStateManager.xStateModelMap.containsKey("profileOne"), true);
      expect(_xStateManager.xStateModelMap.containsKey("profileTwo"), true);
      _xStateManager.removeModel("profileOne");
      expect(_xStateManager.xStateModelMap.containsKey("profileOne"), false);
      expect(_xStateManager.xStateModelMap.containsKey("profileTwo"), true);
    });

    test('[XStateManager] Get XStateModel from XStateManager.', () {
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
}
