import '/backend/backend.dart';
import '/components/component_heading_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'medication_widget.dart' show MedicationWidget;
import 'package:flutter/material.dart';

class MedicationModel extends FlutterFlowModel<MedicationWidget> {
  ///  Local state fields for this component.

  bool shouldShowSearch = false;

  ///  State fields for stateful widgets in this component.

  // Model for ComponentHeading component.
  late ComponentHeadingModel componentHeadingModel1;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Algolia Search Results from action on TextField
  List<MedicationRecord>? algoliaSearchResults = [];
  // Model for ComponentHeading component.
  late ComponentHeadingModel componentHeadingModel2;

  @override
  void initState(BuildContext context) {
    componentHeadingModel1 =
        createModel(context, () => ComponentHeadingModel());
    componentHeadingModel2 =
        createModel(context, () => ComponentHeadingModel());
  }

  @override
  void dispose() {
    componentHeadingModel1.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    componentHeadingModel2.dispose();
  }
}
