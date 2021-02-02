import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:path_provider/path_provider.dart';
import '../../components/appbar.dart';
import 'package:video_player/video_player.dart';
import 'preview.dart';

class Camera extends StatefulWidget {
  static String route = "Camera";

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

/// Returns a suitable camera icon for [direction].
IconData getCameraLensIcon(CameraLensDirection direction) {
  switch (direction) {
    case CameraLensDirection.back:
      return Icons.camera_rear;
    case CameraLensDirection.front:
      return Icons.camera_front;
    case CameraLensDirection.external:
      return Icons.camera;
  }
  throw ArgumentError('Unknown lens direction');
}

void logError(String code, String message) =>
    // ignore: avoid_print
    print('Error: $code\nError Message: $message');

class _CameraScreenState extends State<Camera>
    with WidgetsBindingObserver, TickerProviderStateMixin {
  CameraController controller;
  // XFile imageFile;
  // XFile videoFile;
  // VideoPlayerController videoController;
  // VoidCallback videoPlayerListener;
  // bool enableAudio = true;
  // double _minAvailableExposureOffset = 0.0;
  // double _maxAvailableExposureOffset = 0.0;
  // double _currentExposureOffset = 0.0;
  // AnimationController _flashModeControlRowAnimationController;
  // Animation<double> _flashModeControlRowAnimation;
  // AnimationController _exposureModeControlRowAnimationController;
  // Animation<double> _exposureModeControlRowAnimation;
  // AnimationController _focusModeControlRowAnimationController;
  // Animation<double> _focusModeControlRowAnimation;
  // double _minAvailableZoom;
  // double _maxAvailableZoom;
  // double _currentScale = 1.0;
  // double _baseScale = 1.0;

  List cameras;
  int selectedCameraIndex;
  String imgPath;

  Future initCamera(CameraDescription cameraDescription) async {
    if (controller != null) {
      await controller.dispose();
    }

    controller = CameraController(cameraDescription, ResolutionPreset.high);

    controller.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });

    if (controller.value.hasError) {
      // ignore: avoid_print
      print('Camera Error ${controller.value.errorDescription}');
    }

    try {
      await controller.initialize();
    } on CameraException catch (e) {
      logError(e.code, e.description);
    }

    if (mounted) {
      setState(() {});
    }
  }

  // Display the preview from the camera (or a message if the preview is not available).
  Widget cameraPreview() {
    if (controller == null || !controller.value.isInitialized) {
      return const Text(
        'Loading',
        style: TextStyle(
            color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
      );
    }

    return Align(
      child: CameraPreview(controller),
    );
  }

  Widget cameraControl(context) {
    return Expanded(
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            FloatingActionButton(
              backgroundColor: Colors.white,
              onPressed: () {
                takePicture();
              },
              child: const Icon(
                Icons.camera,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget cameraToggle() {
    if (cameras == null || cameras.isEmpty) {
      return const Spacer();
    }

    final CameraDescription selectedCamera = cameras[selectedCameraIndex];
    final CameraLensDirection lensDirection = selectedCamera.lensDirection;

    return Expanded(
      child: Align(
        alignment: Alignment.centerLeft,
        child: TextButton.icon(
            onPressed: () {
              onSwitchCamera();
            },
            icon: Icon(
              getCameraLensIcon(lensDirection),
              color: Colors.white,
              size: 24,
            ),
            label: Text(
              '${lensDirection.toString().substring(lensDirection.toString().indexOf('.') + 1).toUpperCase()}',
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w500),
            )),
      ),
    );
  }

  Future<XFile> takePicture() async {
    // ignore: avoid_print
    print("take picture");

    if (!controller.value.isInitialized) {
      // ignore: avoid_print
      print('Error: select a camera first.');
      // showInSnackBar('Error: select a camera first.');
      return null;
    }

    if (controller.value.isTakingPicture) {
      // A capture is already pending, do nothing.
      // ignore: avoid_print
      print("A capture is already pending, do nothing.");
      return null;
    }

    try {
      final XFile file = await controller.takePicture();
      // ignore: avoid_print
      print(file);
      return file;
    } on CameraException catch (e) {
      _showCameraException(e);
      return null;
    }
  }

  onCapture(context) async {
    try {
      final p = await getTemporaryDirectory();
      final name = DateTime.now();
      final path = "${p.path}/$name.png";

      await controller.takePicture().then((value) {
        // ignore: avoid_print
        print('here');
        // ignore: avoid_print
        print(path);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PreviewScreen(
                      imgPath: path,
                      fileName: "$name.png",
                    )));
      });
    } on CameraException catch (e) {
      _showCameraException(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    availableCameras().then((value) {
      cameras = value;
      if (cameras.isNotEmpty) {
        setState(() {
          selectedCameraIndex = 0;
        });
        initCamera(cameras[selectedCameraIndex]).then((value) {});
      } else {
        // ignore: avoid_print
        print('No camera available');
      }
    }).catchError((e) {
      // ignore: avoid_print
      print('Error : ${e.code}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: const AppBarComponent(title: 'Dashboard'),
      body: Stack(
        children: <Widget>[
//            Expanded(
//              flex: 1,
//              child: _cameraPreviewWidget(),
//            ),
          Align(
            child: cameraPreview(),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 120,
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              color: Colors.transparent,
              child: Row(
                children: <Widget>[
                  cameraToggle(),
                  cameraControl(context),
                  const Spacer(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  onSwitchCamera() {
    selectedCameraIndex =
        selectedCameraIndex < cameras.length - 1 ? selectedCameraIndex + 1 : 0;
    final CameraDescription selectedCamera = cameras[selectedCameraIndex];
    initCamera(selectedCamera);
  }

  void _showCameraException(CameraException e) {
    logError(e.code, e.description);
    // showInSnackBar('Error: ${e.code}\n${e.description}');
  }
}
