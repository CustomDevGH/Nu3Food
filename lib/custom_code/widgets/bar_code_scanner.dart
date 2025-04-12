// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
// Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// my imports
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:google_mlkit_barcode_scanning/google_mlkit_barcode_scanning.dart';
import 'package:camera/camera.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'dart:async';
import '../../ocr_components/o_c_r_header/o_c_r_header_widget.dart';

import '../../components/scanner_page_components/sliding_up_panel_from_ean/sliding_up_panel_from_ean_widget.dart';
import '../../components/scanner_page_components/close_scanner_button/close_scanner_button_widget.dart';
import '../../components/scanner_page_components/scan_product_message/scan_product_message_widget.dart';
import 'package:nu3_food/components/scanner_page_components/add_manually_button/add_manually_button_widget.dart';
import 'package:flutter_svg/svg.dart';

enum states {
  SCANNING_NAME,
  SCANNING_EAN,
  SCANNING_NUTRITION,
  SCANNING_INGREDIENTS,
  SCANNING_ALLERGENS,
}

class BarCodeScanner extends StatefulWidget {
  const BarCodeScanner({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  _BarCodeScannerState createState() => _BarCodeScannerState();
}

class _BarCodeScannerState extends State<BarCodeScanner>
    with TickerProviderStateMixin {
  final Color _safeFoodColor = Colors.green.withOpacity(0.5);
  final Color _dangerounsFoodColor = Colors.red.withOpacity(0.5);
  final Color _neutralColor = const Color(0x001c0d26).withOpacity(0.5);
  final Color _mildFoodColor = Colors.yellow.withOpacity(0.5);
  List<String> _requestedEans = [];
  String _currentDisplayedEan = '';
  final PanelController _panelController = PanelController();
  ProductsRecord? _scannedFood;
  late Color _backdropColor; //initial color
  bool _panelOpened = false;
  String _ean = '';
  bool isTorchOn = false;
  int _sameUnknownEanScanned = 0;
  bool _shouldShowUnknowEanButton = false;
  bool _foundSomethingUseful = false;
  bool _canShowAddManuallyButton = true;
  bool _ocr = false;

  // ocr vars
  // colors
  final ProductsStruct _food = ProductsStruct();

  late states currentState;

  Map<states, String> messages = {
    states.SCANNING_NAME: "Scanning name...",
    states.SCANNING_EAN: "Scanning EAN...",
    states.SCANNING_NUTRITION: "Scanning nutrition...",
    states.SCANNING_INGREDIENTS: "Scanning ingredients...",
    states.SCANNING_ALLERGENS: "Scanning allergens...",
  };

  Map<states, Size> sizes = {
    states.SCANNING_NAME: const Size(0.5, 0.5),
    states.SCANNING_EAN: const Size(1, 1),
    states.SCANNING_NUTRITION: const Size(0.7, 0.8),
    states.SCANNING_INGREDIENTS: const Size(0.7, 0.8),
    states.SCANNING_ALLERGENS: const Size(0.7, 0.8),
  };

  late Size currentSize;
  late String currentMessage;

  // ocr methods
  Future<void> _onDataScanned(String data) async {
    switch (currentState) {
      case states.SCANNING_NAME:
        _scanName(data);
        break;
      case states.SCANNING_EAN:
        _scanEan(data);
        break;
      case states.SCANNING_NUTRITION:
        _scanNutrition(data);
        break;
      case states.SCANNING_INGREDIENTS:
        _scanIngredient(data);
        break;
      case states.SCANNING_ALLERGENS:
        _scanAllergens(data);
        break;
      default:
        break;
    }
    return;
  }

  // TODO: implement scanning nutrition
  Future<void> _scanNutrition(String data) async {}
  Future<void> _scanIngredient(String data) async {}
  Future<void> _scanAllergens(String data) async {}
  Stack ocrBs() {
    return Stack(
      children: <Widget>[
        ScannerPage(
          onEanScanned: _onDataScanned,
          isTorchOn: isTorchOn,
          scanningType: currentState == states.SCANNING_EAN ? 1 : 0,
        ),
        ClipPath(
          clipper: HoleClipper(currentSize.width, currentSize.height),
          child: Container(
            color: _backdropColor,
          ),
        ),
        const Align(
          alignment: Alignment(0.9, 0.9),
          child: CloseScannerButtonWidget(),
        ),
        SizedBox(
          width: double.infinity,
          height: 204,
          child: OCRHeaderWidget(
            currentName: currentMessage,
          ),
        ),
        Align(
          alignment: const Alignment(-0.9, 0.9),
          child: _switchTorchToggle(),
        ),
      ],
    );
  }

  Future<void> _scanName(String data) async {
    if (data.isNotEmpty) {
      _food.name = data;
      setState(() {
        currentMessage = messages[states.SCANNING_EAN]!;
        currentSize = sizes[states.SCANNING_EAN]!;
        currentState = states.SCANNING_EAN;
      });
    }
  }

  Future<void> _scanEan(String data) async {
    if (data.isNotEmpty) {
      _food.ean = data;
      setState(() {
        currentMessage = messages[states.SCANNING_NUTRITION]!;
        currentSize = sizes[states.SCANNING_NUTRITION]!;
        currentState = states.SCANNING_NUTRITION;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _backdropColor = _neutralColor;
    _getRequestedEans();
    _backdropColor = _neutralColor;
    currentState = states.SCANNING_NAME;
    currentMessage = messages[currentState]!;
    currentMessage = messages[currentState]!;
    currentSize = sizes[currentState]!;
  }

  @override
  void dispose() {
    _panelController.close();

    super.dispose();
  }

  Future<void> _getRequestedEans() async {
    final t = await queryRequestedEansRecordOnce();
    final requestedEans = t.map((e) => e.ean).toList();
    setState(() {
      _requestedEans = requestedEans;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _ocr ? ocrBs() : BarCodeBs(context);
  }

  GestureDetector BarCodeBs(BuildContext context) {
    return GestureDetector(
      onVerticalDragEnd: (details) async {
        // if (details.primaryVelocity! > 0 &&
        //     _foundSomethingUseful &&
        //     !_panelOpened &&
        //     !_panelController.isPanelAnimating) {
        //   _panelOpened = true;
        //   _currentDisplayedEan = _ean;
        //   setState(() {});
        //   await _panelController.animatePanelToPosition(
        //     1,
        //     duration: Duration(milliseconds: 300),
        //   );
        //   return;
        // } else
        if (details.primaryVelocity! < 0 &&
            _panelOpened &&
            !_panelController.isPanelShown &&
            !_panelController.isPanelAnimating) {
          _panelOpened = false;
          _currentDisplayedEan = '';
          setState(() {});
          await _panelController.close();
        }
      },
      onTap: () async {
        if (_foundSomethingUseful &&
            !_panelOpened &&
            !_panelController.isPanelAnimating) {
          await _panelController.animatePanelToPosition(
            1,
            duration: const Duration(milliseconds: 300),
          );

          _panelOpened = true;
          _currentDisplayedEan = _ean;
          setState(() {});

          return;
        } else if (_panelOpened &&
            !_panelController.isPanelShown &&
            !_panelController.isPanelAnimating) {
          _panelOpened = false;
          _currentDisplayedEan = '';
          setState(() {});
          await _panelController.close();
        }
      },
      child: SlidingUpPanel(
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
        body: Stack(
          children: <Widget>[
            ScannerPage(
              onEanScanned: _onEanScanned,
              isTorchOn: isTorchOn,
            ),
            ClipPath(
              clipper: HoleClipper(0.5, 0.5),
              child: Container(
                color: _backdropColor,
              ),
            ),
            const Align(
              alignment: Alignment(0.9, 0.9),
              child: CloseScannerButtonWidget(),
            ),
            if (FFAppState().isOcrEnabled)
              Align(
                alignment: const Alignment(0, 0.9),
                child: FloatingActionButton(
                  heroTag: Object(),
                  onPressed: () async {
                    setState(() {
                      _ocr = true;
                    });
                  },
                  backgroundColor: const Color.fromRGBO(183, 193, 250, 1),
                  foregroundColor: const Color.fromRGBO(56, 47, 115, 1),
                ),
              ),
            const SizedBox(
              width: double.infinity,
              height: 204,
              child: ScanProductMessageWidget(),
            ),
            Align(
              alignment: const Alignment(-0.9, 0.9),
              child: _switchTorchToggle(),
            ),
            Align(
              alignment: const Alignment(0.9, -0.9),
              child: _switchToDateWizzard(),
            ),
            Align(
              alignment: const Alignment(0, 0.9),
              child: _shouldShowUnknowEanButton && _canShowAddManuallyButton
                  ? AddManuallyButtonWidget(
                      ean: _ean,
                      onPressed: () async {
                        _getRequestedEans();

                        setState(() {
                          _shouldShowUnknowEanButton = false;
                          _canShowAddManuallyButton = false;
                        });
                        Timer(const Duration(seconds: 2), () {
                          setState(() {
                            _canShowAddManuallyButton = true;
                          });
                        });
                      })
                  : Container(),
            )
          ],
        ),
      ),
    );
  }

  Widget _switchTorchToggle() => SizedBox(
        height: 50.0,
        width: 50.0,
        child: FloatingActionButton(
          heroTag: Object(),
          onPressed: () {
            isTorchOn = !isTorchOn;
            setState(() {});
          },
          backgroundColor: const Color.fromRGBO(183, 193, 120, 1),
          foregroundColor: const Color.fromRGBO(56, 47, 115, 1),
          child: SvgPicture.asset(
            "assets/images/Light.svg",
            width: 34,
            height: 34,
            fit: BoxFit.contain,
          ),
        ),
      );

  Widget _switchToDateWizzard() => SizedBox(
        height: 50.0,
        width: 50.0,
        child: FloatingActionButton(
          heroTag: Object(),
          onPressed: () {
            context.goNamed('OcrDateWizzard');
          },
          backgroundColor: const Color.fromRGBO(183, 193, 250, 1),
          foregroundColor: const Color.fromRGBO(56, 47, 115, 1),
          child: SvgPicture.asset(
            "assets/images/Light.svg",
            width: 34,
            height: 34,
            fit: BoxFit.contain,
          ),
        ),
      );

  Future<void> _onEanScanned(String ean) async {
    if (_panelOpened) return;
    if (_currentDisplayedEan == ean && ean.isNotEmpty) return;
    if (ean == _ean &&
        ean.isNotEmpty &&
        (_sameUnknownEanScanned == 0 || _sameUnknownEanScanned > 5)) return;

    if (_requestedEans.contains(ean)) {
      // here tell user that this ean was requested already using snackbar that disappiers after some time
      // will translate later to slovak
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('This product was requested already'),
          duration: Duration(seconds: 2),
        ),
      );
      setState(() {
        _sameUnknownEanScanned = 0;
        _ean = ean;
      });
      return;
    }
    if (ean.isEmpty) {
      _backdropColor = _neutralColor;
      _ean = '';
      _foundSomethingUseful = false;
      _shouldShowUnknowEanButton = false;

      if (_panelController.isAttached &&
          mounted &&
          _panelController.isPanelShown &&
          !_panelController.isPanelOpen) {
        if (mounted) {
          setState(() {
            _backdropColor = _neutralColor;
            _ean = '';
            _foundSomethingUseful = false;
          });
        }

        await _panelController.animatePanelToPosition(
          0,
          duration: const Duration(milliseconds: 200),
        );
        _panelOpened = false;

        if (mounted) {
          setState(() {
            _scannedFood = null;
          });
        }
      }
      return;
    }

    final scannedFood = await getFoodFromEAN(ean, true);

    if (scannedFood != null) {
      _foundSomethingUseful = true;
      var isSafe = await isFoodSafe(scannedFood.allergens);
      var isFineWithDrugs = true;
      if (FFAppState().medicaments) {
        isFineWithDrugs = await isDrugComplient(scannedFood);
      }
      _backdropColor = !isSafe
          ? _dangerounsFoodColor
          : !isFineWithDrugs
              ? _mildFoodColor
              : _safeFoodColor;
      _sameUnknownEanScanned = 0;
      if (_panelController.isAttached &&
          _panelController.isPanelClosed &&
          mounted &&
          !_panelController.isPanelAnimating) {
        await _panelController.animatePanelToSnapPoint(
            duration: const Duration(milliseconds: 300));
        _panelOpened = false;
      }
      if (mounted) {
        setState(() {
          _scannedFood = scannedFood;
          _shouldShowUnknowEanButton = false;
        });
      }
    } else {
      _backdropColor = _neutralColor;
      if (_ean == ean) {
        _sameUnknownEanScanned++;
      } else {
        _sameUnknownEanScanned = 1;
      }

      _ean = ean;

      if (_sameUnknownEanScanned >= 3) {
        _shouldShowUnknowEanButton = true;
      }

      _scannedFood = null;
      if (mounted) {
        setState(() {});
      }
    }
  }
}

// clipping the center of camera view out
class HoleClipper extends CustomClipper<Path> {
  HoleClipper(this.width, this.height);
  final double width;
  final double height;

  @override
  Path getClip(Size size) {
    var outerPath = Path()
      ..addRect(Rect.fromLTWH(0.0, 0.0, size.width, size.height));

    var innerPath = Path()
      ..addRect(Rect.fromCenter(
        center: Offset(size.width / 2, size.height / 2),
        width: size.width * width,
        height: size.width * height,
      ));

    return Path.combine(PathOperation.difference, outerPath, innerPath);
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class ScannerPage extends StatefulWidget {
  const ScannerPage(
      {super.key,
      required this.onEanScanned,
      this.isTorchOn = false,
      this.scanningType = 1});

  final Function(String) onEanScanned;
  final bool isTorchOn;
  final int scanningType;

  @override
  _ScannerPageState createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {
  CustomPaint? _customPaint;
  var _cameraLensDirection = CameraLensDirection.back;
  final BarcodeScanner _barcodeScanner = BarcodeScanner();
  final TextRecognizer _textRecognizer = TextRecognizer();

  int _timesDidntFoundEan = 0;
  int _timesFoundEan = 0;

  bool _canProcess = true;
  bool _isBusy = false;

  @override
  Widget build(BuildContext context) {
    return CameraView(
      customPaint: _customPaint,
      onImage: _processImage,
      initialCameraLensDirection: _cameraLensDirection,
      onCameraLensDirectionChanged: (value) => _cameraLensDirection = value,
      isTorchOn: widget.isTorchOn,
    );
  }

  @override
  void dispose() {
    _barcodeScanner.close();
    _canProcess = false;
    _textRecognizer.close();
    super.dispose();
  }

  Future<void> _processImage(InputImage inputImage) async {
    // EAN is 1
    switch (widget.scanningType) {
      case 0:
        _getTextFromImage(inputImage);
        break;
      case 1:
        _getBarCode(inputImage);
        break;
      default:
        print("Error vole");
        return;
    }
  }

  Future<void> _getBarCode(InputImage inputImage) async {
    if (!_canProcess) {
      return;
    }
    if (_isBusy) return;
    _isBusy = true;
    // use this later for displaying a message to aim camera to barcode
    setState(() {});
    final barcodes = await _barcodeScanner.processImage(inputImage);
    bool foundEan = barcodes.where((b) => b.displayValue != null).isNotEmpty;

    _isBusy = false;

    if (mounted) {
      // display message after some unsucessfull scans to aim camera to barcode
      setState(() {
        if (foundEan) {
          _timesDidntFoundEan = 0;
          _timesFoundEan++;
          // choose color based on food safety
          if (_timesFoundEan > 5) {
            _timesFoundEan = 0;
            widget.onEanScanned(barcodes.first.displayValue!);
          }
          widget.onEanScanned(barcodes.first.displayValue!);
        } else if (!foundEan && _timesDidntFoundEan > 60) {
          widget.onEanScanned('');
          _timesFoundEan = 0;
        } else {
          _timesDidntFoundEan++;
        }
      });
    }
  }

  Future<void> _getTextFromImage(InputImage inputImage) async {
    if (!_canProcess) {
      return;
    }
    if (_isBusy) return;
    _isBusy = true;
    // use this later for displaying a message to aim camera to barcode
    setState(() {});

    final recognizedText = await _textRecognizer.processImage(inputImage);

    print("${recognizedText.text}\n\n\n");

    _isBusy = false;

    if (mounted) {
      // display message after some unsucessfull scans to aim camera to barcode
      setState(() {});
    }
  }
}
