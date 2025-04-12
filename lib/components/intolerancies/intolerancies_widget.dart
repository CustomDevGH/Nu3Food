import '/components/component_heading_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'intolerancies_model.dart';
export 'intolerancies_model.dart';

class IntoleranciesWidget extends StatefulWidget {
  const IntoleranciesWidget({super.key});

  @override
  State<IntoleranciesWidget> createState() => _IntoleranciesWidgetState();
}

class _IntoleranciesWidgetState extends State<IntoleranciesWidget> {
  late IntoleranciesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IntoleranciesModel());
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
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          wrapWithModel(
            model: _model.componentHeadingModel,
            updateCallback: () => safeSetState(() {}),
            child: ComponentHeadingWidget(
              title: FFLocalizations.of(context).getText(
                'xtv5yvz4' /* My preferences */,
              ),
              description: FFLocalizations.of(context).getText(
                '0wq8f3m4' /* Intolerancies */,
              ),
              spacing: 4,
              titleSize: 20,
              descriptionSize: 16,
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
            child: FlutterFlowChoiceChips(
              options: [
                ChipData(FFLocalizations.of(context).getText(
                  'wk3wjgs4' /* Wheat */,
                )),
                ChipData(FFLocalizations.of(context).getText(
                  'p2mshd0m' /* Crustaceans */,
                )),
                ChipData(FFLocalizations.of(context).getText(
                  '3jo6ppbt' /* Eggs */,
                )),
                ChipData(FFLocalizations.of(context).getText(
                  'l9fty51k' /* Fish */,
                )),
                ChipData(FFLocalizations.of(context).getText(
                  't9nu3dx8' /* Peanuts */,
                )),
                ChipData(FFLocalizations.of(context).getText(
                  '56yvj6gf' /* Soybeans */,
                )),
                ChipData(FFLocalizations.of(context).getText(
                  '70ryefpb' /* Milk */,
                )),
                ChipData(FFLocalizations.of(context).getText(
                  'snee8f0w' /* Nuts */,
                )),
                ChipData(FFLocalizations.of(context).getText(
                  '9ux8lpst' /* Celery */,
                )),
                ChipData(FFLocalizations.of(context).getText(
                  'km3fczi3' /* Mustard */,
                )),
                ChipData(FFLocalizations.of(context).getText(
                  'hoeugyln' /* Sesame */,
                )),
                ChipData(FFLocalizations.of(context).getText(
                  's9x4vj8y' /* Sulphites */,
                )),
                ChipData(FFLocalizations.of(context).getText(
                  '5oztm4nk' /* Lupin */,
                )),
                ChipData(FFLocalizations.of(context).getText(
                  'cjorje3a' /* Molluscs */,
                ))
              ],
              onChanged: (val) async {
                safeSetState(() => _model.choiceChipsValues = val);
                logFirebaseEvent('INTOLERANCIES_ChoiceChips_y5nymz6a_ON_FO');
                FFAppState().Allergies =
                    _model.choiceChipsValues!.toList().cast<String>();
                _model.updatePage(() {});
              },
              selectedChipStyle: ChipStyle(
                backgroundColor: const Color(0xFF382F73),
                textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Roboto',
                      color: const Color(0xFFF7F7F7),
                      letterSpacing: 0.15,
                      fontWeight: FontWeight.w800,
                      lineHeight: 1.5,
                    ),
                iconColor: const Color(0x00000000),
                iconSize: 0.0,
                labelPadding:
                    const EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 6.0, 0.0),
                elevation: 0.0,
                borderColor: const Color(0xFF382F73),
                borderWidth: 1.3,
                borderRadius: BorderRadius.circular(6.0),
              ),
              unselectedChipStyle: ChipStyle(
                backgroundColor: const Color(0x00000000),
                textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Roboto',
                      color: const Color(0xFFAFACC7),
                      letterSpacing: 0.15,
                      fontWeight: FontWeight.w800,
                      lineHeight: 1.5,
                    ),
                iconColor: const Color(0x00000000),
                iconSize: 0.0,
                labelPadding:
                    const EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 6.0, 0.0),
                elevation: 0.0,
                borderColor: const Color(0xFFAFACC7),
                borderWidth: 1.3,
                borderRadius: BorderRadius.circular(6.0),
              ),
              chipSpacing: 8.0,
              rowSpacing: 8.0,
              multiselect: true,
              initialized: _model.choiceChipsValues != null,
              alignment: WrapAlignment.start,
              controller: _model.choiceChipsValueController ??=
                  FormFieldController<List<String>>(
                FFAppState().Allergies,
              ),
              wrapped: true,
            ),
          ),
        ],
      ),
    );
  }
}
