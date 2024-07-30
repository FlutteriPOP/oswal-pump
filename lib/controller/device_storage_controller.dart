import 'package:get/get.dart';

import '../utils/storage.dart';

class DeviceController extends GetxController {
  final StorageService _storageService = StorageService();

  var deviceId = ''.obs;
  var userId = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadDeviceId();
    
  }

  void saveDeviceId(String id) {
    deviceId.value = id;
    _storageService.write('device_id', id);
  }

  void saveUserId(String id) {
    userId.value = id;
    _storageService.write('user_id', id);
  }

  void loadDeviceId() {
    final storedId = _storageService.read<String>('device_id');
    if (storedId != null) {
      deviceId.value = storedId;
    }
  }
}
