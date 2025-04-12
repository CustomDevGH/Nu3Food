import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'notifications_widget.dart' show NotificationsWidget;
import 'package:flutter/material.dart';

class NotificationsModel extends FlutterFlowModel<NotificationsWidget> {
  ///  Local state fields for this component.

  List<EURssFeedModelStruct> rssFeed = [];
  void addToRssFeed(EURssFeedModelStruct item) => rssFeed.add(item);
  void removeFromRssFeed(EURssFeedModelStruct item) => rssFeed.remove(item);
  void removeAtIndexFromRssFeed(int index) => rssFeed.removeAt(index);
  void insertAtIndexInRssFeed(int index, EURssFeedModelStruct item) =>
      rssFeed.insert(index, item);
  void updateRssFeedAtIndex(
          int index, Function(EURssFeedModelStruct) updateFn) =>
      rssFeed[index] = updateFn(rssFeed[index]);

  bool feedLoaded = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - parseXml] action in Notifications widget.
  List<EURssFeedModelStruct>? alertList;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
