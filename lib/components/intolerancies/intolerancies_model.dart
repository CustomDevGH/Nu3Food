import '/components/component_heading_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'intolerancies_widget.dart' show IntoleranciesWidget;
import 'package:flutter/material.dart';

class IntoleranciesModel extends FlutterFlowModel<IntoleranciesWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for ComponentHeading component.
  late ComponentHeadingModel componentHeadingModel;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  List<String>? get choiceChipsValues => choiceChipsValueController?.value;
  set choiceChipsValues(List<String>? val) =>
      choiceChipsValueController?.value = val;

  @override
  void initState(BuildContext context) {
    componentHeadingModel = createModel(context, () => ComponentHeadingModel());
  }

  @override
  void dispose() {
    componentHeadingModel.dispose();
  }
}
