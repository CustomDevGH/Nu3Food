import '/components/home_components/header/header_widget.dart';
import '/components/home_components/scanned_items/scanned_items_widget.dart';
import '/components/intolerancies/intolerancies_widget.dart';
import '/components/medication/medication_widget.dart';
import '/components/scanner_page_components/open_scanner_button/open_scanner_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:ui';
import 'home_widget.dart' show HomeWidget;
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnController;
  // Model for Header component.
  late HeaderModel headerModel;
  // Model for ScannedItems component.
  late ScannedItemsModel scannedItemsModel;
  // Model for Intolerancies component.
  late IntoleranciesModel intoleranciesModel;
  // Model for Medication component.
  late MedicationModel medicationModel;
  // Model for OpenScannerButton component.
  late OpenScannerButtonModel openScannerButtonModel;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
    headerModel = createModel(context, () => HeaderModel());
    scannedItemsModel = createModel(context, () => ScannedItemsModel());
    intoleranciesModel = createModel(context, () => IntoleranciesModel());
    medicationModel = createModel(context, () => MedicationModel());
    openScannerButtonModel =
        createModel(context, () => OpenScannerButtonModel());
  }

  @override
  void dispose() {
    columnController?.dispose();
    headerModel.dispose();
    scannedItemsModel.dispose();
    intoleranciesModel.dispose();
    medicationModel.dispose();
    openScannerButtonModel.dispose();
  }
}
