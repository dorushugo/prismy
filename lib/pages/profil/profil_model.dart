import '/components/horizontal_swipe_component_widget.dart';
import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'profil_widget.dart' show ProfilWidget;
import 'package:flutter/material.dart';

class ProfilModel extends FlutterFlowModel<ProfilWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for horizontalSwipeComponent component.
  late HorizontalSwipeComponentModel horizontalSwipeComponentModel;
  // Model for NavBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    horizontalSwipeComponentModel =
        createModel(context, () => HorizontalSwipeComponentModel());
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    horizontalSwipeComponentModel.dispose();
    navBarModel.dispose();
  }
}
