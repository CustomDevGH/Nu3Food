import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'personal_info_model.dart';
export 'personal_info_model.dart';

class PersonalInfoWidget extends StatefulWidget {
  const PersonalInfoWidget({
    super.key,
    String? greetingText,
  }) : greetingText = greetingText ?? 'Fill out your information';

  final String greetingText;

  @override
  State<PersonalInfoWidget> createState() => _PersonalInfoWidgetState();
}

class _PersonalInfoWidgetState extends State<PersonalInfoWidget> {
  late PersonalInfoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PersonalInfoModel());

    _model.textController ??=
        TextEditingController(text: currentUserDisplayName);
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return SizedBox(
      width: double.infinity,
      child: Form(
        key: _model.formKey,
        autovalidateMode: AutovalidateMode.disabled,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.greetingText,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Roboto',
                    color: FlutterFlowTheme.of(context).primary,
                    fontSize: 20.0,
                    letterSpacing: 0.15,
                    fontWeight: FontWeight.w800,
                    lineHeight: 1.4,
                  ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(6.0),
                border: Border.all(
                  color: const Color(0xFFAFACC7),
                  width: 2.0,
                ),
              ),
              child: AuthUserStreamWidget(
                builder: (context) => SizedBox(
                  width: double.infinity,
                  child: TextFormField(
                    controller: _model.textController,
                    focusNode: _model.textFieldFocusNode,
                    onChanged: (_) => EasyDebounce.debounce(
                      '_model.textController',
                      const Duration(milliseconds: 2000),
                      () async {
                        logFirebaseEvent(
                            'PERSONAL_INFO_TextField_uu9h7wdu_ON_TEXT');

                        await currentUserReference!
                            .update(createUsersRecordData(
                          displayName: _model.textController.text,
                        ));
                      },
                    ),
                    autofocus: false,
                    obscureText: false,
                    decoration: InputDecoration(
                      isDense: false,
                      labelText: FFLocalizations.of(context).getText(
                        'tl0j5ukv' /* Title */,
                      ),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                      contentPadding: const EdgeInsetsDirectional.fromSTEB(
                          15.0, 10.0, 16.0, 10.0),
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Roboto',
                          color: FlutterFlowTheme.of(context).primary,
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                          lineHeight: 1.5,
                        ),
                    validator:
                        _model.textControllerValidator.asValidator(context),
                  ),
                ),
              ),
            ),
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                logFirebaseEvent('PERSONAL_INFO_Container_1pwfp388_ON_TAP');
                final datePickedDate = await showDatePicker(
                  context: context,
                  initialDate: getCurrentTimestamp,
                  firstDate: DateTime(1900),
                  lastDate: getCurrentTimestamp,
                );

                if (datePickedDate != null) {
                  safeSetState(() {
                    _model.datePicked = DateTime(
                      datePickedDate.year,
                      datePickedDate.month,
                      datePickedDate.day,
                    );
                  });
                }
                FFAppState().dateOfBirdth = _model.datePicked;
                FFAppState().dobSet = true;
                safeSetState(() {});
              },
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(6.0),
                  border: Border.all(
                    color: const Color(0xFFAFACC7),
                    width: 2.0,
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 16.0, 10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        valueOrDefault<String>(
                          FFAppState().dobSet == true
                              ? dateTimeFormat(
                                  "yMMMd",
                                  FFAppState().dateOfBirdth,
                                  locale:
                                      FFLocalizations.of(context).languageCode,
                                )
                              : (FFLocalizations.of(context).languageCode ==
                                      'en'
                                  ? 'Date of birdth'
                                  : 'Dátum narodenia'),
                          'Date of birdth',
                        ),
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Roboto',
                              color: FlutterFlowTheme.of(context).primary,
                              fontSize: 16.0,
                              letterSpacing: 0.15,
                              fontWeight: FontWeight.w600,
                              lineHeight: 1.55,
                            ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(0.0),
                        child: SvgPicture.asset(
                          'assets/images/Calendar.svg',
                          width: 24.0,
                          height: 24.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ].divide(const SizedBox(width: 10.0)),
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              child: FlutterFlowDropDown<String>(
                controller: _model.dropDownValueController ??=
                    FormFieldController<String>(
                  _model.dropDownValue ??= FFAppState().gender,
                ),
                options: [
                  FFLocalizations.of(context).getText(
                    'ulejwi2y' /* Male */,
                  ),
                  FFLocalizations.of(context).getText(
                    'xk29a6ac' /* Female */,
                  ),
                  FFLocalizations.of(context).getText(
                    'oa8xf1yu' /* Attack hellicopter */,
                  )
                ],
                onChanged: (val) async {
                  safeSetState(() => _model.dropDownValue = val);
                  logFirebaseEvent('PERSONAL_INFO_DropDown_sh64k2mm_ON_FORM_');
                  FFAppState().gender = _model.dropDownValue!;
                  safeSetState(() {});
                },
                width: double.infinity,
                height: 45.0,
                textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Roboto',
                      color: FlutterFlowTheme.of(context).primary,
                      fontSize: 16.0,
                      letterSpacing: 0.15,
                      fontWeight: FontWeight.w600,
                      lineHeight: 1.55,
                    ),
                hintText: FFLocalizations.of(context).getText(
                  'bdrrcflo' /* Gender */,
                ),
                icon: Icon(
                  Icons.fingerprint,
                  color: FlutterFlowTheme.of(context).primary,
                  size: 24.0,
                ),
                fillColor: FlutterFlowTheme.of(context).primaryBackground,
                elevation: 3.0,
                borderColor: const Color(0xFFAFACC7),
                borderWidth: 2.0,
                borderRadius: 6.0,
                margin: const EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 16.0, 10.0),
                hidesUnderline: true,
                isSearchable: false,
                isMultiSelect: false,
              ),
            ),
          ].divide(const SizedBox(height: 12.0)),
        ),
      ),
    );
  }
}
