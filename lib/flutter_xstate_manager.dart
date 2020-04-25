import 'package:flutter_xstate/flutter_xstate_model.dart';

class XStateManager {
  Map<String, XStateModel> _xStateModelMap = {};
  static final XStateManager _xStateManager = XStateManager._internal();

  factory XStateManager() => _xStateManager;

  XStateManager._internal();

  Map<String, XStateModel> get xStateModelMap => _xStateModelMap;

  void addModel(XStateModel _xStateModel) {
    if (_xStateModelMap.isEmpty) {
      _xStateModelMap.addAll({_xStateModel.xStateModelName: _xStateModel});
    } else {
      if (!_xStateModelMap.containsKey(_xStateModel.xStateModelName)) {
        _xStateModelMap.addAll({_xStateModel.xStateModelName: _xStateModel});
      }
    }
  }

  void removeModel(String _xStateModelName) {
    _xStateModelMap.removeWhere((k, v) => k == _xStateModelName);
  }

  void updateModel(XStateModel _xStateModelUpdate) {
    if (_xStateModelMap.containsKey(_xStateModelUpdate.xStateModelName)) {
      _xStateModelMap.update(_xStateModelUpdate.xStateModelName, (xStateModel) {
        return XStateModel(
          xStateModelName: xStateModel.xStateModelName,
          isEnable: _xStateModelUpdate.isEnable ?? xStateModel.isEnable,
          isVisible: _xStateModelUpdate.isVisible ?? xStateModel.isVisible,
          onPressed: _xStateModelUpdate.onPressed ?? xStateModel.onPressed,
          onSaved: _xStateModelUpdate.onSaved ?? xStateModel.onSaved,
          validator: _xStateModelUpdate.validator ?? xStateModel.validator,
          test: _xStateModelUpdate.test ?? xStateModel.test,
        );
      });
    }
  }

  XStateModel getModel(String _xStateModelName) {
    if (_xStateModelMap.containsKey(_xStateModelName)) {
      return _xStateModelMap[_xStateModelName];
    } else {
      return null;
    }
  }
}
