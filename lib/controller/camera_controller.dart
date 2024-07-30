// import 'package:camera/camera.dart';
// import 'package:get/get.dart';
// import 'package:path_provider/path_provider.dart';

// class CameraController extends GetxController {
//   late List<CameraDescription> _cameras;
//   late CameraController _cameraController;
//   late Future<void> _initializeControllerFuture;

//   @override
//   void onInit() {
//     super.onInit();
//     _initializeCameras();
//   }

//   Future<void> _initializeCameras() async {
//     try {
//       _cameras = await availableCameras();
//       _cameraController = CameraController(
//         _cameras[0], // Pass the first camera
//         ResolutionPreset.max,
//       );
//       _initializeControllerFuture = _cameraController.initialize();
//       update(); // Notify listeners
//     } catch (e) {
//       if (e is CameraException) {
//         print('Camera Exception: ${e.code}');
//       } else {
//         print('Error: $e');
//       }
//     }
//   }

//   Future<void> takePicture() async {
//     try {
//       final directory = await getExternalStorageDirectory();
//       final filePath = '${directory?.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';

//       await _cameraController.takePicture();

//       // Optional: Show a snackbar or dialog with the file path
//       print('Picture saved to: $filePath');
//     } catch (e) {
//       print('Error taking picture: $e');
//     }
//   }

//   @override
//   void onClose() {
//     _cameraController.dispose();
//     super.onClose();
//   }
// }