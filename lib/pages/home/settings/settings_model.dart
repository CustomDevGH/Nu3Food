import '/components/avatar_menu/avatar_menu_widget.dart';
import '/components/intolerancies/intolerancies_widget.dart';
import '/components/medication/medication_widget.dart';
import '/components/personal_info/personal_info_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'settings_widget.dart' show SettingsWidget;
import 'package:flutter/material.dart';

class SettingsModel extends FlutterFlowModel<SettingsWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnController;
  // Model for AvatarMenu component.
  late AvatarMenuModel avatarMenuModel;
  // Model for PersonalInfo component.
  late PersonalInfoModel personalInfoModel;
  // Model for Intolerancies component.
  late IntoleranciesModel intoleranciesModel;
  // Model for Medication component.
  late MedicationModel medicationModel;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
    avatarMenuModel = createModel(context, () => AvatarMenuModel());
    personalInfoModel = createModel(context, () => PersonalInfoModel());
    intoleranciesModel = createModel(context, () => IntoleranciesModel());
    medicationModel = createModel(context, () => MedicationModel());
  }

  @override
  void dispose() {
    columnController?.dispose();
    avatarMenuModel.dispose();
    personalInfoModel.dispose();
    intoleranciesModel.dispose();
    medicationModel.dispose();
  }
}
