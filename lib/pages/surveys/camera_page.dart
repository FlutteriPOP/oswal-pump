import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:oswal/pages/widgets/appbar_widget.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late List<CameraDescription> _cameras;
  CameraController? _cameraController;

  @override
  void initState() {
    super.initState();
    setupCamera();
    
  }

  Future<void> setupCamera() async {

    _cameras = await availableCameras();
    if (_cameras.isNotEmpty) {
      _cameraController = CameraController(_cameras[0], ResolutionPreset.high);
      await _cameraController!.initialize();
      if (!mounted) {
        return;
      }
      setState(() {});
    }
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarWidget(
        title: 'Camera',
      ),
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    if (_cameraController == null || !_cameraController!.value.isInitialized) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return Stack(
        children: [
          Positioned.fill(
            child: CameraPreview(_cameraController!),
          ),
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Center(
              child: FloatingActionButton(
                onPressed: () {
                  // Add your capture logic here
                },
                child: const Icon(Icons.camera),
              ),
            ),
          ),
        ],
      );
    }
  }
}
