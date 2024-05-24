import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'auth_component_model.dart';
export 'auth_component_model.dart';

class AuthComponentWidget extends StatefulWidget {
  const AuthComponentWidget({super.key});

  @override
  State<AuthComponentWidget> createState() => _AuthComponentWidgetState();
}

class _AuthComponentWidgetState extends State<AuthComponentWidget> {
  late AuthComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AuthComponentModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Colors.transparent,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('AUTH_COMPONENT_Container_v7lawx9j_ON_TAP');
                  setState(() {
                    _model.loading = true;
                  });
                  GoRouter.of(context).prepareAuthEvent();
                  final user = await authManager.signInWithApple(context);
                  if (user == null) {
                    return;
                  }
                  FFAppState().IsGuest = false;
                  if (FFAppState().DoneWizzard == false) {
                    context.goNamedAuth('Wizard', context.mounted);
                  } else {
                    context.goNamedAuth('Home', context.mounted);
                  }

                  setState(() {
                    _model.loading = false;
                  });
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.apple_outlined,
                          color: Colors.white,
                          size: 24.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 10.0, 10.0, 10.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'nltnyzvs' /* Sign in with Apple */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Roboto',
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    letterSpacing: 0.32,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('AUTH_COMPONENT_Container_zqj4xrj4_ON_TAP');
                  GoRouter.of(context).prepareAuthEvent();
                  final user = await authManager.signInWithFacebook(context);
                  if (user == null) {
                    return;
                  }
                  FFAppState().IsGuest = false;
                  if (FFAppState().DoneWizzard == false) {
                    context.goNamedAuth('Wizard', context.mounted);
                  } else {
                    context.goNamedAuth('Home', context.mounted);
                  }
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xFF1877F2),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.facebook_sharp,
                          color: Color(0xFFFFFFFE),
                          size: 24.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 10.0, 0.0, 10.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'gbe6jirv' /* Continue with Facebook */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Roboto',
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    letterSpacing: 0.32,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('AUTH_COMPONENT_Container_guy6opqj_ON_TAP');
                  GoRouter.of(context).prepareAuthEvent();
                  final user = await authManager.signInWithGoogle(context);
                  if (user == null) {
                    return;
                  }
                  FFAppState().IsGuest = false;
                  if (FFAppState().DoneWizzard == false) {
                    context.goNamedAuth('Wizard', context.mounted);
                  } else {
                    context.goNamedAuth('Home', context.mounted);
                  }

                  setState(() {
                    _model.loading = false;
                  });
                },
                child: Material(
                  color: Colors.transparent,
                  elevation: 1.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(7.6),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(0.0),
                            child: Image.asset(
                              'assets/images/Wrapper.png',
                              width: 22.8,
                              height: 22.8,
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 10.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              '7s7pf04t' /* Sign in with Google */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Roboto',
                                  color: Color(0xFF757575),
                                  fontSize: 14.0,
                                  letterSpacing: 0.32,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                      ],
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
                  logFirebaseEvent('AUTH_COMPONENT_Container_spmxjtm1_ON_TAP');
                  FFAppState().IsGuest = true;
                  GoRouter.of(context).prepareAuthEvent();
                  final user = await authManager.signInAnonymously(context);
                  if (user == null) {
                    return;
                  }

                  context.goNamedAuth('Home', context.mounted);
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            'elbpjfvc' /* Continue without registration */,
                          ),
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Roboto',
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.15,
                                    fontWeight: FontWeight.w800,
                                    lineHeight: 1.5,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ].divide(SizedBox(height: 12.0)),
          ),
        ),
        if (_model.loading)
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(0.0),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 2.0,
                  sigmaY: 2.0,
                ),
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Container(
                    width: 150.0,
                    height: 150.0,
                    child: custom_widgets.LoadingIndicator(
                      width: 150.0,
                      height: 150.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
