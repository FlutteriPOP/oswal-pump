import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:oswal/controller/device_storage_controller.dart';

class FirebaseApi {
  final FirebaseMessaging messaging = FirebaseMessaging.instance;

  Future<void> init() async {
    DeviceStorageController deviceController =
        Get.put(DeviceStorageController());
    log('Requesting notification permissions');

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      log('Permission granted.');

      try {
        // Delay fetching token until after GetMaterialApp is initialized
        await Future.delayed(const Duration(milliseconds: 100));

        String? token = await messaging.getToken();
        if (token != null) {
          deviceController.saveDeviceToken(token);
          log('Token retrieved: $token');
        } else {
          log('Failed to retrieve token');
        }
      } catch (e) {
        log('Error retrieving token or saving device ID: $e');
      }
    } else {
      log('Notification permission not granted');
    }
  }
}
