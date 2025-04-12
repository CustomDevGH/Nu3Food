// Automatic FlutterFlow imports
// Imports other custom widgets
// Imports custom actions
// Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// my imports
import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:flutter_svg/svg.dart';

class AwesomeFlashToggleButton extends StatelessWidget {
  final CameraState state;
  final AwesomeTheme? theme;
  final Widget Function(FlashMode) iconBuilder;
  final void Function(SensorConfig, FlashMode) onFlashTap;

  AwesomeFlashToggleButton({
    super.key,
    required this.state,
    this.theme,
    Widget Function(FlashMode)? iconBuilder,
    void Function(SensorConfig, FlashMode)? onFlashTap,
  })  : iconBuilder = iconBuilder ??
            ((flashMode) {
              final IconData icon;
              switch (flashMode) {
                case FlashMode.none:
                  icon = Icons.flash_off;
                  break;
                case FlashMode.on:
                  icon = Icons.flash_on;
                  break;
                case FlashMode.auto:
                  icon = Icons.flash_auto;
                  break;
                case FlashMode.always:
                  icon = Icons.flashlight_on;
                  break;
              }
              return AwesomeCircleWidget.icon(
                icon: icon,
                theme: theme,
              );
            }),
        onFlashTap = onFlashTap ??
            ((sensorConfig, flashMode) {
              if (flashMode == FlashMode.none) {
                flashMode = FlashMode.always;
              } else {
                flashMode = FlashMode.none;
              }
              sensorConfig.setFlashMode(flashMode);
            });

  @override
  Widget build(BuildContext context) {
    final theme = this.theme ?? AwesomeThemeProvider.of(context).theme;
    return StreamBuilder<SensorConfig>(
      stream: state.sensorConfig$,
      builder: (_, sensorConfigSnapshot) {
        if (!sensorConfigSnapshot.hasData) {
          return const SizedBox.shrink();
        }
        final sensorConfig = sensorConfigSnapshot.requireData;
        return StreamBuilder<FlashMode>(
          stream: sensorConfig.flashMode$,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox.shrink();
            }

            return SizedBox(
              height: 50.0,
              width: 50.0,
              child: FloatingActionButton(
                onPressed: () {
                  onFlashTap(sensorConfig, snapshot.requireData);
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
          },
        );
      },
    );
  }
}
