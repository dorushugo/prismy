import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_widget.dart' show HomeWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  Local state fields for this page.

  List<dynamic> checkupSemaine = [];
  void addToCheckupSemaine(dynamic item) => checkupSemaine.add(item);
  void removeFromCheckupSemaine(dynamic item) => checkupSemaine.remove(item);
  void removeAtIndexFromCheckupSemaine(int index) =>
      checkupSemaine.removeAt(index);
  void insertAtIndexInCheckupSemaine(int index, dynamic item) =>
      checkupSemaine.insert(index, item);
  void updateCheckupSemaineAtIndex(int index, Function(dynamic) updateFn) =>
      checkupSemaine[index] = updateFn(checkupSemaine[index]);

  DateTime? daySelected;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getLastSevenDays] action in Home widget.
  List<DateTime>? lastSevenDays;
  // State field(s) for Carousel widget.
  CarouselController? carouselController1;
  int carouselCurrentIndex1 = 1;

  // State field(s) for Carousel widget.
  CarouselController? carouselController2;
  int carouselCurrentIndex2 = 1;

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for NavBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    navBarModel.dispose();
  }
}
