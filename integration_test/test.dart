import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:nu3_food/flutter_flow/flutter_flow_drop_down.dart';

import 'package:nu3_food/flutter_flow/flutter_flow_widgets.dart';
import 'package:nu3_food/flutter_flow/flutter_flow_theme.dart';
import 'package:nu3_food/index.dart';
import 'package:nu3_food/main.dart';
import 'package:nu3_food/flutter_flow/flutter_flow_util.dart';

import 'package:provider/provider.dart';
import 'package:nu3_food/backend/firebase/firebase_config.dart';
import 'package:nu3_food/auth/firebase_auth/auth_util.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await initFirebase();

    await FFLocalizations.initialize();
  });

  setUp(() async {
    await authManager.signOut();
    FFAppState.reset();
    final appState = FFAppState();
    await appState.initializePersistedState();
  });

  testWidgets('Test test', (WidgetTester tester) async {
    _overrideOnError();

    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => FFAppState(),
      child: MyApp(),
    ));

    await tester.tap(find.text('Continue without registration'));
    await tester.pumpAndSettle(
      Duration(milliseconds: 10),
      EnginePhase.sendSemanticsUpdate,
      Duration(milliseconds: 3000),
    );
    expect(find.text('Hi user!'), findsWidgets);
  });

  testWidgets('Test of auth', (WidgetTester tester) async {
    _overrideOnError();
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: 'kapitulcinjakub1@gmail.com', password: 'heslo123');
    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => FFAppState(),
      child: MyApp(),
    ));

    await tester.tap(find.text('Sign in with Google'));
    await tester.pumpAndSettle(Duration(milliseconds: 20));
    expect(find.text('Create your profile'), findsOneWidget);
  });

  testWidgets('LoggedOutSettingsTest', (WidgetTester tester) async {
    _overrideOnError();

    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => FFAppState(),
      child: MyApp(),
    ));

    await tester.tap(find.byKey(ValueKey('Home_h7zf')));
  });
}

// There are certain types of errors that can happen during tests but
// should not break the test.
void _overrideOnError() {
  final originalOnError = FlutterError.onError!;
  FlutterError.onError = (errorDetails) {
    if (_shouldIgnoreError(errorDetails.toString())) {
      return;
    }
    originalOnError(errorDetails);
  };
}

bool _shouldIgnoreError(String error) {
  // It can fail to decode some SVGs - this should not break the test.
  if (error.contains('ImageCodecException')) {
    return true;
  }
  // Overflows happen all over the place,
  // but they should not break tests.
  if (error.contains('overflowed by')) {
    return true;
  }
  // Sometimes some images fail to load, it generally does not break the test.
  if (error.contains('No host specified in URI') ||
      error.contains('EXCEPTION CAUGHT BY IMAGE RESOURCE SERVICE')) {
    return true;
  }
  // These errors should be avoided, but they should not break the test.
  if (error.contains('setState() called after dispose()')) {
    return true;
  }

  return false;
}
