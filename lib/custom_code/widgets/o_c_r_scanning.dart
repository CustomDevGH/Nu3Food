// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'index.dart'; // Imports other custom widgets
// Imports custom actions
// Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// my imports
import 'package:image/image.dart' as img;
import '../../components/scanner_page_components/close_scanner_button/close_scanner_button_widget.dart';
import 'package:camera/camera.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_mlkit_barcode_scanning/google_mlkit_barcode_scanning.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:nu3_food/ocr_components/o_c_r_header/o_c_r_header_widget.dart';

enum states {
  SCANNING_NAME,
  SCANNING_EAN,
  SCANNING_NUTRITION,
  SCANNING_INGREDIENTS,
  SCANNING_ALLERGENS,
}

class OCRScanning extends StatefulWidget {
  const OCRScanning({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  _OCRScanningState createState() => _OCRScanningState();
}

class _OCRScanningState extends State<OCRScanning> {
  // colors
  final Color _neutralColor = const Color(0x001c0d26).withOpacity(0.5);
  late Color _backdropColor; //initial color
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
    states.SCANNING_NAME: const Size(0.5, 0.1),
    states.SCANNING_EAN: const Size(1, 1),
    states.SCANNING_NUTRITION: const Size(0.5, 0.5),
    states.SCANNING_INGREDIENTS: const Size(0.5, 0.5),
    states.SCANNING_ALLERGENS: const Size(0.5, 0.5),
  };

  late Size currentSize;
  late String currentMessage;

  bool isTorchOn = false;

  @override
  void initState() {
    _backdropColor = _neutralColor;
    currentMessage = messages[currentState]!;
    currentMessage = messages[currentState]!;
    currentSize = sizes[currentState]!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _ScannerPage(
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

  Widget _switchTorchToggle() => SizedBox(
        height: 50.0,
        width: 50.0,
        child: FloatingActionButton(
          heroTag: Object(),
          onPressed: () {
            setState(() {
              isTorchOn = !isTorchOn;
            });
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

  // TODO: implement scanning nutrition
  Future<void> _scanNutrition(String data) async {}
  Future<void> _scanIngredient(String data) async {}
  Future<void> _scanAllergens(String data) async {}
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

class _ScannerPage extends StatefulWidget {
  const _ScannerPage({
    required this.onEanScanned,
    required this.scanningType,
    this.isTorchOn = false,
  });

  final Function(String) onEanScanned;
  final bool isTorchOn;
  final int scanningType;

  @override
  _ScannerPageState createState() => _ScannerPageState();
}

class _ScannerPageState extends State<_ScannerPage> {
  CustomPaint? _customPaint;
  var _cameraLensDirection = CameraLensDirection.back;
  final TextRecognizer _textRecognizer = TextRecognizer();
  final _barcodeScanner = BarcodeScanner();

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
    _textRecognizer.close();
    _canProcess = false;
    super.dispose();
  }

  Future<void> _processImage(InputImage inputImage) async {
    // EAN is 1
    switch (widget.scanningType) {
      case 0:
        _getTextFromImage(inputImage);
        break;
      case 1:
        _getEanFromImage(inputImage);
        break;
      default:
        print("Error vole");
        return;
    }
  }

  // cant process image here because it is possible to have 2 states(ean and image)
  // splitting it into 2 methods with state
  Future<void> _getTextFromImage(InputImage inputImage) async {
    if (!_canProcess) {
      return;
    }
    if (_isBusy) return;
    _isBusy = true;
    // use this later for displaying a message to aim camera to barcode
    setState(() {});

    final original = img.decodeImage(inputImage.bytes!);

    if (original == null) {
      return; // or handle this case appropriately
    }

    // Define the coordinates and size of the crop region
    int x = (original.width * 0.25).toInt();
    int y = (original.height * 0.25).toInt();
    int w = (original.width * 0.5).toInt();
    int h = (original.height * 0.5).toInt();

    // Crop the image
    img.Image cropped = img.copyCrop(original, x: x, y: y, width: w, height: h);

    inputImage = InputImage.fromBytes(
      bytes: img.encodeJpg(cropped),
      metadata: InputImageMetadata(
        size: Size(cropped.width.toDouble(), cropped.height.toDouble()),
        rotation: InputImageRotation.rotation0deg,
        format: InputImageFormat.bgra8888,
        bytesPerRow: cropped.width * 4,
      ),
    );

    final recognizedText = await _textRecognizer.processImage(inputImage);

    print("${recognizedText.text}\n\n\n");

    _isBusy = false;

    if (mounted) {
      // display message after some unsucessfull scans to aim camera to barcode
      setState(() {});
    }
  }

  Future<void> _getEanFromImage(InputImage inputImage) async {
    if (!_canProcess) {
      return;
    }
    if (_isBusy) return;
    _isBusy = true;
    setState(() {});
    final barcodes = await _barcodeScanner.processImage(inputImage);
    bool foundEan = barcodes.where((b) => b.displayValue != null).isNotEmpty;

    _isBusy = false;

    if (mounted) {
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
}
