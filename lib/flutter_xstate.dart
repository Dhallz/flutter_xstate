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
    // if (child is FormField) {
    //   switch (model.isVisible) {
    //     case true:
    //       return FormField(
    //         builder: (child as FormField).builder,
    //         autovalidate: (child as FormField).autovalidate,
    //         enabled: model.isEnable,
    //         initialValue: (child as FormField).initialValue,
    //         key: (child as FormField).key,
    //         onSaved: ,
    //       );
    //       break;
    //     case false:
    //       return Container();
    //       break;
    //   }
    // }
    return child;
  }
}
