import '/components/horizontal_swipe_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'slider_widget.dart' show SliderWidget;
import 'package:flutter/material.dart';

class SliderModel extends FlutterFlowModel<SliderWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for horizontalSwipeComponent component.
  late HorizontalSwipeComponentModel horizontalSwipeComponentModel;

  @override
  void initState(BuildContext context) {
    horizontalSwipeComponentModel =
        createModel(context, () => HorizontalSwipeComponentModel());
  }

  @override
  void dispose() {
    horizontalSwipeComponentModel.dispose();
  }
}
