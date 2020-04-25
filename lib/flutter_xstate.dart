library flutter_xstate;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'flutter_xstate_model.dart';

/// Flutter XState
class XStateDummy extends StatelessWidget {
  final Widget child;
  final XStateModel model;

  XStateDummy(this.child, this.model);

  @override
  Widget build(BuildContext context) {
    // SECTION FloatingActionButton
    if (child is FloatingActionButton) {
      switch (model.isVisible) {
        case true:
          return FloatingActionButton(
            onPressed: model.onPressed,
            autofocus: (child as FloatingActionButton).autofocus,
            backgroundColor: (child as FloatingActionButton).backgroundColor,
            child: (child as FloatingActionButton).child,
            clipBehavior: (child as FloatingActionButton).clipBehavior,
            disabledElevation:
                (child as FloatingActionButton).disabledElevation,
            elevation: (child as FloatingActionButton).elevation,
            focusColor: (child as FloatingActionButton).focusColor,
            focusElevation: (child as FloatingActionButton).focusElevation,
            focusNode: (child as FloatingActionButton).focusNode,
            foregroundColor: (child as FloatingActionButton).foregroundColor,
            heroTag: (child as FloatingActionButton).heroTag,
            highlightElevation:
                (child as FloatingActionButton).highlightElevation,
            hoverColor: (child as FloatingActionButton).hoverColor,
            hoverElevation: (child as FloatingActionButton).hoverElevation,
            isExtended: (child as FloatingActionButton).isExtended,
            key: (child as FloatingActionButton).key,
            materialTapTargetSize:
                (child as FloatingActionButton).materialTapTargetSize,
            mini: (child as FloatingActionButton).mini,
            shape: (child as FloatingActionButton).shape,
            splashColor: (child as FloatingActionButton).splashColor,
            tooltip: (child as FloatingActionButton).tooltip,
          );
          break;
        case false:
          return Container();
          break;
      }
    }
    // SECTION FlatButton
    if (child is FlatButton) {
      switch (model.isVisible) {
        case true:
          return FlatButton(
            child: (child as FlatButton).child,
            key: (child as FlatButton).key,
            onPressed: model.onPressed,
            autofocus: (child as FlatButton).autofocus,
            clipBehavior: (child as FlatButton).clipBehavior,
            color: (child as FlatButton).color,
            colorBrightness: (child as FlatButton).colorBrightness,
            disabledColor: (child as FlatButton).disabledColor,
            disabledTextColor: (child as FlatButton).disabledTextColor,
            focusColor: (child as FlatButton).focusColor,
            // TODO - Add focusNode feature to xState
            focusNode: (child as FlatButton).focusNode,
            highlightColor: (child as FlatButton).highlightColor,
            hoverColor: (child as FlatButton).hoverColor,
            materialTapTargetSize: (child as FlatButton).materialTapTargetSize,
            onHighlightChanged: (child as FlatButton).onHighlightChanged,
            // FIXME - Add to model
            // TODO - Add to model
            onLongPress: model.onLongPress,
            padding: (child as FlatButton).padding,
            shape: (child as FlatButton).shape,
            splashColor: (child as FlatButton).splashColor,
            textColor: (child as FlatButton).textColor,
            textTheme: (child as FlatButton).textTheme,
          );
          break;
        case false:
          return Container();
          break;
      }
    }
    // SECTION FormField
    if (child is FormField) {
      switch (model.isVisible) {
        case true:
          return FormField(
            builder: (child as FormField).builder,
            autovalidate: (child as FormField).autovalidate,
            enabled: model.isEnable,
            initialValue: (child as FormField).initialValue,
            key: (child as FormField).key,
            onSaved: model.onSaved,
            validator: model.validator,
          );
          break;
        case false:
          return Container();
          break;
      }
    }
    // SECTION Container
    if (child is Container) {
      switch (model.isVisible) {
        case true:
          return Container(
            child: (child as Container).child,
          );
          break;
        case false:
          return Container();
          break;
      }
    }
    return child;
  }
}
