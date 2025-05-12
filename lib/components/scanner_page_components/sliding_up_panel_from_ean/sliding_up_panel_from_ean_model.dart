import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'sliding_up_panel_from_ean_widget.dart' show SlidingUpPanelFromEanWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class SlidingUpPanelFromEanModel
    extends FlutterFlowModel<SlidingUpPanelFromEanWidget> {
  ///  Local state fields for this component.

  bool productLoaded = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - getProductById] action in SlidingUpPanelFromEan widget.
  ProductFromOFFStruct? product;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController1;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController2;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController3;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    expandableExpandableController1.dispose();
    expandableExpandableController2.dispose();
    expandableExpandableController3.dispose();
  }
}
