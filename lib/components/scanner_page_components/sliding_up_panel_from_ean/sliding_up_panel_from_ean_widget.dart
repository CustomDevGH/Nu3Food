import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/scanner_detail/nutrition_table_row/nutrition_table_row_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'sliding_up_panel_from_ean_model.dart';
export 'sliding_up_panel_from_ean_model.dart';

class SlidingUpPanelFromEanWidget extends StatefulWidget {
  const SlidingUpPanelFromEanWidget({
    super.key,
    required this.isOpened,
    bool? isSafe,
    required this.doc,
    bool? isLive,
  })  : this.isSafe = isSafe ?? false,
        this.isLive = isLive ?? true;

  final bool? isOpened;
  final bool isSafe;
  final ProductsRecord? doc;
  final bool isLive;

  @override
  State<SlidingUpPanelFromEanWidget> createState() =>
      _SlidingUpPanelFromEanWidgetState();
}

class _SlidingUpPanelFromEanWidgetState
    extends State<SlidingUpPanelFromEanWidget> {
  late SlidingUpPanelFromEanModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SlidingUpPanelFromEanModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('SLIDING_UP_PANEL_FROM_EAN_SlidingUpPanel');
      _model.product = await actions.getProductById(
        widget!.doc!,
      );
      _model.productLoaded = true;
      safeSetState(() {});
    });

    _model.expandableExpandableController1 =
        ExpandableController(initialExpanded: false);
    _model.expandableExpandableController2 =
        ExpandableController(initialExpanded: false);
    _model.expandableExpandableController3 =
        ExpandableController(initialExpanded: false);
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * 0.9,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFF7F7F7),
            FlutterFlowTheme.of(context).lNWhite,
            FlutterFlowTheme.of(context).primaryBackground
          ],
          stops: [0.0, 0.5, 1.0],
          begin: AlignmentDirectional(0.0, -1.0),
          end: AlignmentDirectional(0, 1.0),
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
          topLeft: Radius.circular(valueOrDefault<double>(
            widget!.isLive ? 0.0 : 20.0,
            0.0,
          )),
          topRight: Radius.circular(valueOrDefault<double>(
            widget!.isLive ? 0.0 : 20.0,
            0.0,
          )),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(24.0, 65.0, 24.0, 12.0),
        child: Stack(
          children: [
            if (widget!.isOpened == true)
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 15.0, 24.0, 0.0),
                child: SingleChildScrollView(
                  primary: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        constraints: BoxConstraints(
                          minWidth: double.infinity,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).lNWhite,
                                ),
                                child: Text(
                                  valueOrDefault<String>(
                                    widget!.doc?.name,
                                    'No name',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Roboto',
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        fontSize: 24.0,
                                        letterSpacing: 0.25,
                                        fontWeight: FontWeight.w800,
                                        lineHeight: 1.4,
                                      ),
                                ),
                              ),
                              AutoSizeText(
                                valueOrDefault<String>(
                                  (String var1) {
                                    return var1.split("|").last;
                                  }(widget!.doc!.category),
                                  'Milk',
                                ).maybeHandleOverflow(
                                  maxChars: 25,
                                  replacement: '…',
                                ),
                                maxLines: 2,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Roboto',
                                      color: Color(0xFFAFACC7),
                                      fontSize: 18.0,
                                      letterSpacing: 0.15,
                                      fontWeight: FontWeight.bold,
                                      lineHeight: 1.55,
                                    ),
                              ),
                              Text(
                                valueOrDefault<String>(
                                  widget!.doc?.addressLines?.firstOrNull,
                                  'No producer',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Roboto',
                                      color: Color(0xFFAFACC7),
                                      fontSize: 16.0,
                                      letterSpacing: 0.15,
                                      fontWeight: FontWeight.bold,
                                      lineHeight: 1.5,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (widget!.doc?.allergens?.length != 0)
                        Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  'jk4xh0b8' /* Allergens */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Roboto',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      fontSize: 20.0,
                                      letterSpacing: 0.15,
                                      fontWeight: FontWeight.w800,
                                      lineHeight: 1.4,
                                    ),
                              ),
                              Builder(
                                builder: (context) {
                                  final allergen = functions
                                      .getEveryOtherFromList(
                                          widget!.doc!.allergens.toList(),
                                          FFLocalizations.of(context)
                                                  .languageCode ==
                                              'en')
                                      .toList();

                                  return SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: List.generate(allergen.length,
                                          (allergenIndex) {
                                        final allergenItem =
                                            allergen[allergenIndex];
                                        return Container(
                                          decoration: BoxDecoration(
                                            color: functions.listContainsItem(
                                                    allergenItem,
                                                    FFAppState()
                                                        .Allergies
                                                        .toList())
                                                ? FlutterFlowTheme.of(context)
                                                    .error
                                                : FlutterFlowTheme.of(context)
                                                    .success,
                                            borderRadius:
                                                BorderRadius.circular(6.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 5.0, 8.0, 5.0),
                                            child: Text(
                                              allergenItem,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Roboto',
                                                    color: functions
                                                            .listContainsItem(
                                                                allergenItem,
                                                                FFAppState()
                                                                    .Allergies
                                                                    .toList())
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .lNWhite
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    letterSpacing: 0.15,
                                                    fontWeight: FontWeight.w800,
                                                    lineHeight: 1.5,
                                                  ),
                                            ),
                                          ),
                                        );
                                      }).divide(SizedBox(width: 8.0)),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      if (_model.productLoaded)
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if (_model.product?.nutriscoreGrade !=
                                  EcoScoreGrades.none)
                                Container(
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Container(
                                    width: double.infinity,
                                    color: Colors.white,
                                    child: ExpandableNotifier(
                                      controller: _model
                                          .expandableExpandableController1,
                                      child: ExpandablePanel(
                                        header: Container(
                                          height: 100.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                          ),
                                          child: Container(
                                            width: double.infinity,
                                            height: double.infinity,
                                            child:
                                                custom_widgets.ImageFromString(
                                              width: double.infinity,
                                              height: double.infinity,
                                              name:
                                                  'nutriscore-${_model.product?.nutriscoreGrade?.name}.png',
                                              isInternet: false,
                                            ),
                                          ),
                                        ),
                                        collapsed: Container(
                                          width: double.infinity,
                                          height: 0.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                          ),
                                        ),
                                        expanded: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 0.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '5221zncg' /* Fat */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          color: valueOrDefault<
                                                              Color>(
                                                            () {
                                                              if (_model.product
                                                                      ?.nutriscoreFatLevel ==
                                                                  NutriscoreLevels
                                                                      .low) {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .success;
                                                              } else if (_model
                                                                      .product
                                                                      ?.nutriscoreFatLevel ==
                                                                  NutriscoreLevels
                                                                      .moderate) {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .warning;
                                                              } else {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .error;
                                                              }
                                                            }(),
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                          ),
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'xe760vzf' /* Sugar */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          color: valueOrDefault<
                                                              Color>(
                                                            () {
                                                              if (_model.product
                                                                      ?.nutriscoreSugarLevel ==
                                                                  NutriscoreLevels
                                                                      .low) {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .success;
                                                              } else if (_model
                                                                      .product
                                                                      ?.nutriscoreSaturatedFatLevel ==
                                                                  NutriscoreLevels
                                                                      .moderate) {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .warning;
                                                              } else {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .error;
                                                              }
                                                            }(),
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                          ),
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '65cuwcsd' /* Saturated fats */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          color: valueOrDefault<
                                                              Color>(
                                                            () {
                                                              if (_model.product
                                                                      ?.nutriscoreSaturatedFatLevel ==
                                                                  NutriscoreLevels
                                                                      .low) {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .success;
                                                              } else if (_model
                                                                      .product
                                                                      ?.nutriscoreSaturatedFatLevel ==
                                                                  NutriscoreLevels
                                                                      .moderate) {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .warning;
                                                              } else {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .error;
                                                              }
                                                            }(),
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                          ),
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'qs5r83dc' /* Salt */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          color: valueOrDefault<
                                                              Color>(
                                                            () {
                                                              if (_model.product
                                                                      ?.nutriscoreSaltLevel ==
                                                                  NutriscoreLevels
                                                                      .low) {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .success;
                                                              } else if (_model
                                                                      .product
                                                                      ?.nutriscoreSaltLevel ==
                                                                  NutriscoreLevels
                                                                      .moderate) {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .warning;
                                                              } else {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .error;
                                                              }
                                                            }(),
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                          ),
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ]
                                                .divide(SizedBox(height: 15.0))
                                                .around(SizedBox(height: 15.0)),
                                          ),
                                        ),
                                        theme: ExpandableThemeData(
                                          tapHeaderToExpand: true,
                                          tapBodyToExpand: true,
                                          tapBodyToCollapse: true,
                                          headerAlignment:
                                              ExpandablePanelHeaderAlignment
                                                  .center,
                                          hasIcon: false,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              if (_model.product?.novaGrade != -1)
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                  ),
                                  child: Container(
                                    width: double.infinity,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    child: ExpandableNotifier(
                                      controller: _model
                                          .expandableExpandableController2,
                                      child: ExpandablePanel(
                                        header: Container(
                                          height: 100.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                          ),
                                          child: Container(
                                            width: double.infinity,
                                            height: double.infinity,
                                            child:
                                                custom_widgets.ImageFromString(
                                              width: double.infinity,
                                              height: double.infinity,
                                              name:
                                                  'nova-group-${_model.product?.novaGrade?.toString()}.png',
                                              isInternet: false,
                                            ),
                                          ),
                                        ),
                                        collapsed: Container(
                                          width: double.infinity,
                                          height: 0.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                          ),
                                        ),
                                        expanded: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 20.0, 10.0, 20.0),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  functions
                                                      .getNovaGroupMarkersString(
                                                          _model.product!
                                                              .novaGroupMarkers
                                                              .toList()),
                                                  'No data',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        theme: ExpandableThemeData(
                                          tapHeaderToExpand: true,
                                          tapBodyToExpand: true,
                                          tapBodyToCollapse: true,
                                          headerAlignment:
                                              ExpandablePanelHeaderAlignment
                                                  .center,
                                          hasIcon: false,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              if (_model.product?.ecoScoreGrade !=
                                  EcoScoreGrades.none)
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                  ),
                                  child: Container(
                                    width: double.infinity,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    child: ExpandableNotifier(
                                      controller: _model
                                          .expandableExpandableController3,
                                      child: ExpandablePanel(
                                        header: Text(
                                          FFLocalizations.of(context).getText(
                                            'wx6stky2' /* Ecoscore */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .displaySmall
                                              .override(
                                                fontFamily: 'Roboto',
                                                color: Colors.black,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        collapsed: Container(
                                          width: double.infinity,
                                          height: 100.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                          ),
                                          child: Container(
                                            width: double.infinity,
                                            height: double.infinity,
                                            child:
                                                custom_widgets.ImageFromString(
                                              width: double.infinity,
                                              height: double.infinity,
                                              name:
                                                  'Eco-score_${_model.product?.ecoScoreGrade?.name}.png',
                                              isInternet: false,
                                            ),
                                          ),
                                        ),
                                        expanded: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                't4wyn9zh' /* Lorem ipsum dolor sit amet, co... */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        color:
                                                            Color(0x8A000000),
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ],
                                        ),
                                        theme: ExpandableThemeData(
                                          tapHeaderToExpand: true,
                                          tapBodyToExpand: true,
                                          tapBodyToCollapse: true,
                                          headerAlignment:
                                              ExpandablePanelHeaderAlignment
                                                  .center,
                                          hasIcon: true,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      if (FFAppState().medicaments &&
                          (FFAppState().Medication.length != 0))
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  'z861kbv3' /* Medication contraindications */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Roboto',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      fontSize: 20.0,
                                      letterSpacing: 0.15,
                                      fontWeight: FontWeight.w800,
                                      lineHeight: 1.4,
                                    ),
                              ),
                              custom_widgets.MedicationDisplay(
                                width: double.infinity,
                                height: 120.0,
                                product: widget!.doc,
                              ),
                            ].divide(SizedBox(height: 12.0)),
                          ),
                        ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'ysgynb85' /* Nutrition data */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          fontSize: 16.0,
                                          letterSpacing: 0.15,
                                          fontWeight: FontWeight.w500,
                                          lineHeight: 1.55,
                                        ),
                                  ),
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'mettjq8p' /* 100 g/100ml */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          fontSize: 16.0,
                                          letterSpacing: 0.15,
                                          fontWeight: FontWeight.w500,
                                          lineHeight: 1.55,
                                        ),
                                  ),
                                ],
                              ),
                              Container(
                                width: double.infinity,
                                height: 1.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(0.0),
                                ),
                                child: Builder(
                                  builder: (context) {
                                    final nutrition =
                                        widget!.doc?.nutrients?.toList() ?? [];

                                    return Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: List.generate(nutrition.length,
                                          (nutritionIndex) {
                                        final nutritionItem =
                                            nutrition[nutritionIndex];
                                        return NutritionTableRowWidget(
                                          key: Key(
                                              'Keycb7_${nutritionIndex}_of_${nutrition.length}'),
                                          nutrient: nutritionItem,
                                        );
                                      }).divide(SizedBox(height: 4.0)),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]
                        .divide(SizedBox(height: 16.0))
                        .addToEnd(SizedBox(height: 50.0)),
                  ),
                ),
              ),
            if (widget!.isOpened == false)
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 100.0,
                    constraints: BoxConstraints(
                      minWidth: double.infinity,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 15.0, 24.0, 0.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AutoSizeText(
                              valueOrDefault<String>(
                                widget!.doc?.name,
                                'No name',
                              ).maybeHandleOverflow(
                                maxChars: 20,
                              ),
                              maxLines: 1,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Roboto',
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: 32.0,
                                    letterSpacing: 0.25,
                                    fontWeight: FontWeight.w800,
                                  ),
                            ),
                            AutoSizeText(
                              valueOrDefault<String>(
                                widget!.doc?.addressLines?.firstOrNull,
                                'No producer',
                              ).maybeHandleOverflow(
                                maxChars: 25,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Roboto',
                                    color: Color(0xFFAFACC7),
                                    fontSize: 18.0,
                                    letterSpacing: 0.15,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ].divide(SizedBox(height: 15.0)),
                        ),
                      ),
                    ),
                  ),
                ].addToEnd(SizedBox(height: 70.0)),
              ),
            Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: Container(
                width: double.infinity,
                height: 55.0,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                    topLeft: Radius.circular(0.0),
                    topRight: Radius.circular(0.0),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (widget!.isOpened == false)
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            '6n80je7x' /* Pull down for more information */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Roboto',
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: 12.64,
                                    letterSpacing: 0.5,
                                    fontWeight: FontWeight.w500,
                                    lineHeight: 1.7,
                                  ),
                        ),
                      ),
                    Container(
                      width: 60.0,
                      height: 4.0,
                      decoration: BoxDecoration(
                        color: Color(0xFFAFACC7),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
