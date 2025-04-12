import '/components/authentication/auth_component/auth_component_widget.dart';
import '/components/component_heading_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'welcome_widget.dart' show WelcomeWidget;
import 'package:flutter/material.dart';

class WelcomeModel extends FlutterFlowModel<WelcomeWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Model for ComponentHeading component.
  late ComponentHeadingModel componentHeadingModel1;
  // Model for ComponentHeading component.
  late ComponentHeadingModel componentHeadingModel2;
  // Model for AuthComponent component.
  late AuthComponentModel authComponentModel;

  @override
  void initState(BuildContext context) {
    componentHeadingModel1 =
        createModel(context, () => ComponentHeadingModel());
    componentHeadingModel2 =
        createModel(context, () => ComponentHeadingModel());
    authComponentModel = createModel(context, () => AuthComponentModel());
  }

  @override
  void dispose() {
    componentHeadingModel1.dispose();
    componentHeadingModel2.dispose();
    authComponentModel.dispose();
  }
}
