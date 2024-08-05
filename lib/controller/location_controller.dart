import 'dart:developer';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:oswal/pages/widgets/tost_widget.dart';

class LocationController extends GetxController {
  final RxDouble longitude = 0.0.obs;
  final RxDouble latitude = 0.0.obs;
  final RxString locationName = ''.obs;
  final RxString accuracy = ''.obs;
  final RxString error = ''.obs;

  @override
  void onInit() {
    super.onInit();
    _checkAndRequestPermission();
  }

  Future<void> _checkAndRequestPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        error.value = 'Location permissions are denied';
        showToast('Please allow location permissions');
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      error.value = 'Location permissions are permanently denied';
      showToast('Location permissions are required');
      return;
    }

    await _getLocation();
  }

  Future<void> _getLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      accuracy.value = position.accuracy.toString();
      longitude.value = position.longitude;
      latitude.value = position.latitude;

      log('Latitude: ${position.latitude}, Longitude: ${position.longitude}');

      log('Accuracy: ${position.accuracy}');

      // Reverse geocoding to get location name
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        locationName.value =
            '${place.name}, ${place.street}, ${place.subLocality}, ${place.locality}, ${place.subAdministrativeArea}, ${place.administrativeArea}, ${place.postalCode}, ${place.country}';

        log(locationName.value);
      } else {
        error.value = 'Failed to get location name';
        showToast('Failed to get location name');
      }
    } catch (e) {
      error.value = 'Failed to get location: $e';
      showToast('Failed to get location');
    }
  }
}
