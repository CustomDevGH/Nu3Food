import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/home_components/scanned_item/scanned_item_widget.dart';
import '/components/scanner_page_components/sliding_up_panel_from_ean/sliding_up_panel_from_ean_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'scanned_items_widget.dart' show ScannedItemsWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ScannedItemsModel extends FlutterFlowModel<ScannedItemsWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - getFoodFromEAN] action in Container widget.
  ProductsRecord? product;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
