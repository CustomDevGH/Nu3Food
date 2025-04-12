import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'scanned_item_widget.dart' show ScannedItemWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class ScannedItemModel extends FlutterFlowModel<ScannedItemWidget> {
  ///  Local state fields for this component.

  bool loadedEan = false;

  ProductsRecord? food;

  bool isFoodSafe = false;

  List<String> allergens = [];
  void addToAllergens(String item) => allergens.add(item);
  void removeFromAllergens(String item) => allergens.remove(item);
  void removeAtIndexFromAllergens(int index) => allergens.removeAt(index);
  void insertAtIndexInAllergens(int index, String item) =>
      allergens.insert(index, item);
  void updateAllergensAtIndex(int index, Function(String) updateFn) =>
      allergens[index] = updateFn(allergens[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - getFoodFromEAN] action in ScannedItem widget.
  ProductsRecord? newFood;
  // Stores action output result for [Custom Action - isFoodSafe] action in ScannedItem widget.
  bool? foodSafe;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
