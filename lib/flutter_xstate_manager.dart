import 'package:flutter_xstate/flutter_xstate_model.dart';

class XStateManager {
  Map<String, XStateModel> xStateModelMap = {};
  static final XStateManager _xStateManager = XStateManager._internal();

  factory XStateManager() => _xStateManager;

  XStateManager._internal();

  List<XStateModel> get xStateModelList => xStateModelMap.values.toList();

  void addModel(XStateModel _xStateModel) {
    if (xStateModelMap.isEmpty) {
      xStateModelMap.addAll({_xStateModel.xStateModelName: _xStateModel});
    } else {
      if (!xStateModelMap.containsKey(_xStateModel.xStateModelName)) {
        xStateModelMap.addAll({_xStateModel.xStateModelName: _xStateModel});
      }
    }
  }

  void removeModel(String _xStateModelName) {
    xStateModelMap.removeWhere((k, v) => k == _xStateModelName);
  }

  void updateModel(XStateModel _xStateModelUpdate) {
    if (xStateModelMap.containsKey(_xStateModelUpdate.xStateModelName)) {
      xStateModelMap.update(_xStateModelUpdate.xStateModelName, (xStateModel) {
        return XStateModel(
          xStateModelName: xStateModel.xStateModelName,
          isEnable: _xStateModelUpdate.isEnable ?? xStateModel.isEnable,
          isVisible: _xStateModelUpdate.isVisible ?? xStateModel.isVisible,
          onPressed: _xStateModelUpdate.onPressed ?? xStateModel.onPressed,
          onSaved: _xStateModelUpdate.onSaved ?? xStateModel.onSaved,
          test: _xStateModelUpdate.test ?? xStateModel.test,
        );
      });
    }
  }

  XStateModel getModel(String _xStateModelName) {
    if (xStateModelMap.containsKey(_xStateModelName)) {
      return xStateModelMap[_xStateModelName];
    } else {
      return null;
    }
  }
}
