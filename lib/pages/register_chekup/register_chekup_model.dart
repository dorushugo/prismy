import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'register_chekup_widget.dart' show RegisterChekupWidget;
import 'package:flutter/material.dart';

class RegisterChekupModel extends FlutterFlowModel<RegisterChekupWidget> {
  ///  Local state fields for this page.

  int compteur = 0;

  int? humeurNote;

  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  List<FFUploadedFile> uploadedLocalFiles = [];
  List<String> uploadedFileUrls = [];

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  DailyCheckupRecord? checkupCree;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
