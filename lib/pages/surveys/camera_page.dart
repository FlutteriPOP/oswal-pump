// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oswal/controller/location_controller.dart';
import 'package:oswal/controller/search_controller.dart';

import 'display_image_page.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  final LocationController _locationController = Get.find();
  late List<CameraDescription> _cameras;
  CameraController? _cameraController;
  final int _selectedCameraIndex = 0;

  @override
  void initState() {
    super.initState();
    setupCamera();
  }

  Future<void> setupCamera() async {
    try {
      _cameras = await availableCameras();
      if (_cameras.isNotEmpty) {
        _cameraController = CameraController(
          _cameras[_selectedCameraIndex],
          ResolutionPreset.high,
        );
        await _cameraController!.initialize();
        if (!mounted) return;
        setState(() {});
      } else {
        // Handle case when no cameras are available
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No cameras available')),
        );
      }
    } catch (e) {
      // Handle initialization errors
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error initializing camera: $e')),
      );
    }
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  void _onCapturePressed() async {
    try {
      final XFile? file = await _cameraController?.takePicture();
      if (file != null) {
        log('Photo saved to ${file.path}');

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DisplayCapturedImage(imagePath: file.path),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error capturing photo: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildUI(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _onCapturePressed,
        label: const Text('Capture'),
        icon: const Icon(Icons.camera),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildUI() {
    final SearchBarController searchBarController = Get.find();
    final LocationController locationController = Get.find();

    DateTime now = DateTime.now();

    final data = searchBarController.searchResults.value;

    if (_cameraController == null || !_cameraController!.value.isInitialized) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return Stack(
        children: [
          Positioned.fill(
            child: CameraPreview(_cameraController!),
          ),
          Positioned(
            bottom: 80,
            left: 10,
            right: 10,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      '${data?.applicationNo ?? 'N/A'} - ${data?.farmerName ?? 'N/A'}',
                      style: const TextStyle(color: Colors.white)),
                  // Assuming these are managed via a location controller`
                  Text(
                    'Latitude: ${locationController.latitude}, Longitude: ${locationController.longitude}',
                    style: const TextStyle(color: Colors.white),
                  ),
                  Text(
                    'Location Name: ${_locationController.locationName}',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: const TextStyle(color: Colors.white),
                  ),
                  Text(
                    'Accuracy: ${_locationController.accuracy.split('.').first}',
                    style: const TextStyle(color: Colors.white),
                  ),
                  Text(
                    'Date & Time: ${now.toString()}',
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    }
  }
}
