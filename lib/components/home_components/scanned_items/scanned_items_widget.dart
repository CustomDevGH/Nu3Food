import '/components/home_components/scanned_item/scanned_item_widget.dart';
import '/components/scanner_page_components/sliding_up_panel_from_ean/sliding_up_panel_from_ean_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'scanned_items_model.dart';
export 'scanned_items_model.dart';

class ScannedItemsWidget extends StatefulWidget {
  const ScannedItemsWidget({super.key});

  @override
  State<ScannedItemsWidget> createState() => _ScannedItemsWidgetState();
}

class _ScannedItemsWidgetState extends State<ScannedItemsWidget> {
  late ScannedItemsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ScannedItemsModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Builder(
      builder: (context) {
        final scannedItem = FFAppState().ScannedItems.toList();

        return ListView.separated(
          padding: const EdgeInsets.fromLTRB(
            0,
            0,
            5.0,
            0,
          ),
          primary: false,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: scannedItem.length,
          separatorBuilder: (_, __) => const SizedBox(width: 12.0),
          itemBuilder: (context, scannedItemIndex) {
            final scannedItemItem = scannedItem[scannedItemIndex];
            return Builder(
              builder: (context) => InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('SCANNED_ITEMS_Container_wxybkfib_ON_TAP');
                  _model.product = await actions.getFoodFromEAN(
                    scannedItemItem.ean,
                    false,
                  );
                  await showDialog(
                    barrierColor: const Color(0xC62D2C2C),
                    context: context,
                    builder: (dialogContext) {
                      return Dialog(
                        elevation: 0,
                        insetPadding: EdgeInsets.zero,
                        backgroundColor: Colors.transparent,
                        alignment: const AlignmentDirectional(0.0, 0.0)
                            .resolve(Directionality.of(context)),
                        child: SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.7,
                          width: MediaQuery.sizeOf(context).width * 0.85,
                          child: SlidingUpPanelFromEanWidget(
                            isOpened: true,
                            isSafe: false,
                            doc: _model.product!,
                            isLive: false,
                          ),
                        ),
                      );
                    },
                  );

                  safeSetState(() {});
                },
                child: Container(
                  width: 231.0,
                  decoration: const BoxDecoration(),
                  child: Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: ScannedItemWidget(
                      key: Key(
                          'Key5c6_${scannedItemIndex}_of_${scannedItem.length}'),
                      scannedItem: scannedItemItem,
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
