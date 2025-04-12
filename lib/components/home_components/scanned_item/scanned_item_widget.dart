import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'scanned_item_model.dart';
export 'scanned_item_model.dart';

class ScannedItemWidget extends StatefulWidget {
  const ScannedItemWidget({
    super.key,
    required this.scannedItem,
  });

  final ScannedItemStruct? scannedItem;

  @override
  State<ScannedItemWidget> createState() => _ScannedItemWidgetState();
}

class _ScannedItemWidgetState extends State<ScannedItemWidget> {
  late ScannedItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ScannedItemModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('SCANNED_ITEM_ScannedItem_ON_INIT_STATE');
      _model.newFood = await actions.getFoodFromEAN(
        widget!.scannedItem!.ean,
        false,
      );
      _model.foodSafe = await actions.isFoodSafe(
        _model.newFood?.allergens?.toList(),
      );
      _model.loadedEan = true;
      _model.isFoodSafe = _model.foodSafe!;
      _model.food = _model.newFood;
      safeSetState(() {});
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Builder(
        builder: (context) {
          if (_model.loadedEan) {
            return Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-1.0, -1.0),
                            child: Container(
                              width: 28.0,
                              height: 28.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).primary,
                                shape: BoxShape.circle,
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(0.0),
                                  child: SvgPicture.asset(
                                    'assets/images/rocket.svg',
                                    width: 13.0,
                                    height: 13.0,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 150.0,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                            ),
                            child: AutoSizeText(
                              valueOrDefault<String>(
                                dateTimeFormat(
                                  "EEEE, H:mm",
                                  widget!.scannedItem?.lastScanned,
                                  locale:
                                      FFLocalizations.of(context).languageCode,
                                ),
                                'no dateTime found',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Roboto',
                                    color: Color(0xFFC4C4C4),
                                    fontSize: 11.0,
                                    letterSpacing: 1.05,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                        ].divide(SizedBox(width: 8.0)),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 54.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 15.0, 0.0, 0.0),
                              child: AutoSizeText(
                                valueOrDefault<String>(
                                  _model.food?.name,
                                  'Couldn\'t find name',
                                ),
                                maxLines: 2,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Roboto',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      fontSize: 18.0,
                                      letterSpacing: 0.15,
                                      fontWeight: FontWeight.w800,
                                    ),
                              ),
                            ),
                          ),
                          Text(
                            valueOrDefault<String>(
                              (String var1) {
                                return var1.split("|").last;
                              }(_model.newFood!.category),
                              'Mlieko',
                            ),
                            maxLines: 1,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Roboto',
                                  color: FlutterFlowTheme.of(context).primary,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w800,
                                ),
                          ),
                          Text(
                            valueOrDefault<String>(
                              _model.food?.addressLines?.firstOrNull,
                              'Couldn\'t find producer',
                            ),
                            maxLines: 1,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Roboto',
                                  color: Color(0xFFAFACC7),
                                  fontSize: 12.64,
                                  letterSpacing: 0.5,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ].divide(SizedBox(height: 6.0)),
                      ),
                    ].divide(SizedBox(height: 6.0)),
                  ),

                  // this widget has only sample height, because flutterflow is stupid af so there is something i guess
                  custom_widgets.ScannedItemSafetyText(
                    width: double.infinity,
                    height: 12.0,
                    allergens: _model.newFood!.allergens,
                    ean: widget!.scannedItem?.ean,
                  ),
                ].divide(SizedBox(height: 24.0)),
              ),
            );
          } else {
            return CircularPercentIndicator(
              percent: 0.5,
              radius: 60.0,
              lineWidth: 12.0,
              animation: true,
              animateFromLastPercent: true,
              progressColor: FlutterFlowTheme.of(context).primary,
              backgroundColor: FlutterFlowTheme.of(context).accent4,
              center: Text(
                FFLocalizations.of(context).getText(
                  'h1rwoyzn' /* 50% */,
                ),
                style: FlutterFlowTheme.of(context).headlineSmall.override(
                      fontFamily: 'Roboto',
                      letterSpacing: 0.0,
                    ),
              ),
            );
          }
        },
      ),
    );
  }
}
