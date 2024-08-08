import 'dart:developer';

import 'package:get/get.dart';

import '../utils/storage.dart';

class DeviceStorageController extends GetxController {
  final StorageService _storageService = StorageService();

  var deviceToken = ''.obs;
  var districtId = ''.obs;
  var tehsilId = ''.obs;
  var userId = ''.obs;
  var farmerId = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadDevToken();
    loadUserId();
    // loadDistrictId();
    // loadTehsilId(); // Corrected method call
    loadFarmerId();
  }

  void saveDeviceToken(String id) {
    deviceToken.value = id;
    _storageService.write('device_id', id);
  }

  // void saveDistrictId(String id) {
  //   districtId.value = id;
  //   _storageService.write('district_id', id);
  // }

  void saveUserId(String id) {
    userId.value = id;
    _storageService.write('user_id', id);
  }

  void saveFarmerId(String id) {
    farmerId.value = id;
    _storageService.write('farmer_id', id);
  }

  // void saveTehsilId(String id) {
  //   tehsilId.value = id;
  //   _storageService.write('tehsil_id', id);
  // }

  void loadDevToken() {
    final storedId = _storageService.read<String>('device_id');
    if (storedId != null) {
      deviceToken.value = storedId;
      log('DeviceId : ${deviceToken.value}');
    }
  }

  void loadUserId() {
    final storedId = _storageService.read<String>('user_id');
    if (storedId != null) {
      userId.value = storedId;
      log('UserId : ${userId.value}');
    }
  }

  // void loadDistrictId() {
  //   final storedId = _storageService.read<String>('district_id');
  //   if (storedId != null) {
  //     districtId.value = storedId;
  //   }
  // }

  // void loadTehsilId() {
  //   final storedId = _storageService.read<String>('tehsil_id');
  //   if (storedId != null) {
  //     tehsilId.value = storedId;
  //   }
  // }

  void loadFarmerId() {
    final storedId = _storageService.read<String>('farmer_id');
    if (storedId != null) {
      farmerId.value = storedId;
      log('FarmerId : ${farmerId.value}');
    }
  }
}
