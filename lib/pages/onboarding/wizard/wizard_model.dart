import '/components/avatar_menu/avatar_menu_widget.dart';
import '/components/component_heading_widget.dart';
import '/components/intolerancies/intolerancies_widget.dart';
import '/components/medication/medication_widget.dart';
import '/components/personal_info/personal_info_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'wizard_widget.dart' show WizardWidget;
import 'package:flutter/material.dart';

class WizardModel extends FlutterFlowModel<WizardWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for Column widget.
  ScrollController? columnController1;
  // Model for ComponentHeading component.
  late ComponentHeadingModel componentHeadingModel1;
  // Model for AvatarMenu component.
  late AvatarMenuModel avatarMenuModel;
  // Model for PersonalInfo component.
  late PersonalInfoModel personalInfoModel;
  // State field(s) for Column widget.
  ScrollController? columnController2;
  // Model for ComponentHeading component.
  late ComponentHeadingModel componentHeadingModel2;
  // Model for Intolerancies component.
  late IntoleranciesModel intoleranciesModel;
  // Model for Medication component.
  late MedicationModel medicationModel;

  @override
  void initState(BuildContext context) {
    columnController1 = ScrollController();
    componentHeadingModel1 =
        createModel(context, () => ComponentHeadingModel());
    avatarMenuModel = createModel(context, () => AvatarMenuModel());
    personalInfoModel = createModel(context, () => PersonalInfoModel());
    columnController2 = ScrollController();
    componentHeadingModel2 =
        createModel(context, () => ComponentHeadingModel());
    intoleranciesModel = createModel(context, () => IntoleranciesModel());
    medicationModel = createModel(context, () => MedicationModel());
  }

  @override
  void dispose() {
    columnController1?.dispose();
    componentHeadingModel1.dispose();
    avatarMenuModel.dispose();
    personalInfoModel.dispose();
    columnController2?.dispose();
    componentHeadingModel2.dispose();
    intoleranciesModel.dispose();
    medicationModel.dispose();
  }
}
