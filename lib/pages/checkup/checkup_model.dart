import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'checkup_widget.dart' show CheckupWidget;
import 'package:flutter/material.dart';

class CheckupModel extends FlutterFlowModel<CheckupWidget> {
  ///  Local state fields for this page.

  int compteur = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for Souvenir widget.
  FocusNode? souvenirFocusNode;
  TextEditingController? souvenirTextController;
  String? Function(BuildContext, String?)? souvenirTextControllerValidator;
  // State field(s) for Conseil widget.
  FocusNode? conseilFocusNode;
  TextEditingController? conseilTextController;
  String? Function(BuildContext, String?)? conseilTextControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  DailyCheckupRecord? checkupCree;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    souvenirFocusNode?.dispose();
    souvenirTextController?.dispose();

    conseilFocusNode?.dispose();
    conseilTextController?.dispose();
  }
}
