import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

part 'camera_widget.dart';

class CameraTab extends StatefulWidget {
  final List<CameraDescription> cameras;
  const CameraTab({Key? key, required this.cameras}) : super(key: key);

  @override
  State<CameraTab> createState() => _CameraTabState();
}

class _CameraTabState extends State<CameraTab>
    with WidgetsBindingObserver, TickerProviderStateMixin {
  CameraController? controller;
  XFile? imageFile;
  VoidCallback? videoPlayerListener;
  @override
  void initState() {
    super.initState();
    onNewCameraSelected(widget.cameras.first);
  }

  @override
  Widget build(BuildContext context) {
    return CameraPreview(
      controller!,
      child: CameraWidget(
        onPressed: () async {
          final c = await takePicture()
            ?..length();
          print('dosya uzunluğı:$c');
        },
      ),
    );
  }

  Future<XFile?> takePicture() async {
    final CameraController? cameraController = controller;
    if (cameraController == null || !cameraController.value.isInitialized) {
      return null;
    }

    if (cameraController.value.isTakingPicture) {
      // A capture is already pending, do nothing.
      return null;
    }

    try {
      final XFile file = await cameraController.takePicture();
      return file;
    } on CameraException catch (e) {
      return null;
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final CameraController? cameraController = controller;

    // App state changed before we got the chance to initialize.
    if (cameraController == null || !cameraController.value.isInitialized) {
      return;
    }

    if (state == AppLifecycleState.inactive) {
      cameraController.dispose();
    } else if (state == AppLifecycleState.resumed) {
      onNewCameraSelected(cameraController.description);
    }
  }

  Future<void> onNewCameraSelected(CameraDescription cameraDescription) async {
    if (controller != null) {
      await controller!.dispose();
    }

    final CameraController cameraController = CameraController(
      cameraDescription,
      ResolutionPreset.max,
      enableAudio: false,
      imageFormatGroup: ImageFormatGroup.jpeg,
    );

    controller = cameraController;

    // If the controller is updated then update the UI.
    cameraController.addListener(() {
      if (mounted) {
        setState(() {});
      }
      if (cameraController.value.hasError) {
        print('HATA');
      }
    });

    try {
      await cameraController.initialize();
    } catch (e) {
      print(e);
    }
    if (mounted) {
      setState(() {});
    }
  }
}

class CameraWidget extends StatelessWidget {
  //void Function()? ile aynı anlamda
  final VoidCallback? onPressed;
  const CameraWidget({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Positioned(
          bottom: size.height * 0.1,
          left: size.width * 0.12,
          child: const Icon(
            Icons.flash_off,
            size: 32,
            color: Colors.white,
          ),
        ),
        Positioned(
          bottom: size.height * 0.1,
          right: size.width * .12,
          child: const Icon(
            Icons.cameraswitch_sharp,
            color: Colors.white,
            size: 32,
          ),
        ),
        Positioned(
            bottom: size.height * 0.06,
            height: size.height * 0.12,
            right: size.width * 0.4,
            left: size.width * 0.4,
            child: GestureDetector(
              onTap: onPressed,
              child: Container(
                width: size.width * 0.2,
                decoration: const ShapeDecoration(
                  shape: CircleBorder(
                      side: BorderSide(color: Colors.white, width: 4)),
                ),
              ),
            )),
        Positioned(
          top: size.height * 0.64,
          bottom: size.height * 0.24,
          left: 12,
          right: 12,
          child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                    width: 10,
                  ),
              scrollDirection: Axis.horizontal,
              itemCount: 40,
              itemBuilder: ((context, index) {
                return Container(
                    width: 100, height: 100, color: Colors.grey.shade500);
              })),
        )
      ],
    );
  }
}
