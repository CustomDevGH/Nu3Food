// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom widgets

// my imports
import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:google_mlkit_barcode_scanning/google_mlkit_barcode_scanning.dart';
import '../../components/scanner_page_components/close_scanner_button/close_scanner_button_widget.dart';
import 'package:nu3_food/custom_code/actions/ml_kit_utils.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class CameraForWizzard extends StatefulWidget {
  final String? ean;
  final width;
  final height;

  const CameraForWizzard({super.key, this.width, this.height, this.ean = ""});

  @override
  CameraForWizzardState createState() => CameraForWizzardState();
}

class CameraForWizzardState extends State<CameraForWizzard> {
  final _barcodeScanner = BarcodeScanner();

  List<Barcode> _barcodes = [];
  AnalysisImage? _image;
  final PanelController _panelController = PanelController();
  bool _panelOpened = false;
  ProductsRecord? _scannedFood;

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      controller: _panelController,
      minHeight: 0,
      maxHeight: MediaQuery.of(context).size.height * 0.8,
      panel: _scannedFood != null
          ? SlidingUpPanelFromEanWidget(
              doc: _scannedFood,
              isOpened: _panelOpened,
            )
          : Container(),
      snapPoint: 0.4,
      onPanelClosed: () {
        _panelOpened = false;
      },
      renderPanelSheet: false,
      backdropTapClosesPanel: true,
      backdropColor: Colors.grey,
      backdropEnabled: _panelOpened && !_panelController.isPanelAnimating,
      backdropOpacity: 0.8,
      slideDirection: SlideDirection.DOWN,
      defaultPanelState: PanelState.CLOSED,
      isDraggable: true,
      onPanelOpened: () {
        if (!_panelOpened) {
          setState(() {
            _panelOpened = true;
          });
        }
      },
      onPanelSlide: (position) {
        if (position <= 0.5 && _panelOpened) {
          setState(() {
            _panelOpened = false;
          });
        }
        if (position > 0.5 && !_panelOpened) {
          setState(() {
            _panelOpened = true;
          });
        }
      },
      body: CameraAwesomeBuilder.awesome(
        theme: AwesomeTheme(
          bottomActionsBackgroundColor: Colors.transparent,
          buttonTheme: AwesomeButtonTheme(
            foregroundColor: const Color.fromRGBO(183, 193, 120, 1),
            backgroundColor: const Color.fromRGBO(56, 47, 115, 1),
            rotateWithCamera: false,
          ),
        ),
        saveConfig: SaveConfig.photoAndVideo(
          initialCaptureMode: CaptureMode.photo,
        ),
        sensorConfig: SensorConfig.single(
          flashMode: FlashMode.none,
          aspectRatio: CameraAspectRatios.ratio_16_9,
        ),
        previewFit: CameraPreviewFit.fitWidth,
        onMediaTap: (mediaCapture) {
          // mediaCapture.captureRequest
          //     .when(single: (single) => single.file?.open()); // file utils from github
        },
        previewDecoratorBuilder: (state, preview) {
          return BarcodePreviewOverlay(
            state: state,
            barcodes: _barcodes,
            analysisImage: _image,
            preview: preview,
          );
        },
        bottomActionsBuilder: (state) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 20.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AwesomeFlashToggleButton(state: state),
                const CloseScannerButtonWidget(),
              ],
            ),
          );
        },
        middleContentBuilder: (state) {
          return const SizedBox.shrink();
        },
        topActionsBuilder: (state) {
          return const Padding(
            padding: EdgeInsets.only(bottom: 20, top: 35),
            child: Text(
              "Scan your barcodes",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
          );
        },
        onImageForAnalysis: (img) => _processImageBarcode(img),
        imageAnalysisConfig: AnalysisConfig(
          androidOptions: const AndroidAnalysisOptions.nv21(
            width: 256,
          ),
          maxFramesPerSecond: 3,
        ),
      ),
    );
  }

  Future _processImageBarcode(AnalysisImage img) async {
    try {
      var recognizedBarCodes =
          await _barcodeScanner.processImage(img.toInputImage());

      for (var i = 0; i < recognizedBarCodes.length; i++) {
        debugPrint(recognizedBarCodes[i].displayValue);
      }

      if (recognizedBarCodes.length >= 1) {
        final scannedFood =
            await getFoodFromEAN(recognizedBarCodes[0].rawValue!, true);
        if (scannedFood != null) {
          if (_panelController.isAttached &&
              _panelController.isPanelClosed &&
              mounted &&
              !_panelController.isPanelAnimating) {
            await _panelController.animatePanelToSnapPoint(
                duration: const Duration(milliseconds: 300));
            _panelOpened = false;
          }
          _scannedFood = scannedFood;
        }
      }

      setState(() {
        _barcodes = recognizedBarCodes;
        _image = img;
      });
    } catch (error) {
      debugPrint("...sending image resulted error $error");
    }
  }
}
