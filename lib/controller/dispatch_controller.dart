import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:oswal/pages/widgets/tost_widget.dart';

import '../model/dispatch_model.dart';
import '../utils/apis.dart';
import '../utils/const.dart';
import 'device_storage_controller.dart';

class DispatchController extends GetxController {
  final DeviceStorageController deviceController =
      Get.find<DeviceStorageController>();
  final RxBool isLoading = false.obs;
  final Rx<DispatchModel?> dispatchData = Rx<DispatchModel?>(null);

  final Dio dio = Dio();
  final Map<String, String> _dispatchStatusMap =
      {}; // Local state for dispatch statuses

  @override
  void onInit() {
    super.onInit();
    getDispatch();
  }

  Future<void> getDispatch() async {
    isLoading.value = true;
    final jsonData = {
      'user_id': deviceController.userId.value,
      'farmer_id': deviceController.farmerId.value,
      'token': deviceController.deviceToken.value,
      'device_type': deviceType,
      'language': language,
    };

    try {
      final response = await dio
          .post(ApiLinks.baseUrl + ApiLinks.getAssetDispatch, data: jsonData);
      if (response.statusCode == 200) {
        dispatchData.value = DispatchModel.fromJson(response.data);
        // Initialize local dispatch status map
        _dispatchStatusMap.clear();
        dispatchData.value?.data[0].farmerAsset.forEach((asset) {
          _dispatchStatusMap[asset.assetId.toString()] = asset.dispatch ?? '0';
        });
        log('Dispatch Data: ${response.data}');
      } else {
        log('Error: ${response.statusCode} ${response.data}');
      }
    } catch (e) {
      log('Exception: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> setDispatch({required String assetId}) async {
    if (_dispatchStatusMap[assetId] == "1") {
      showToast('Dispatch status is already set.');
      return;
    }
    isLoading.value = true;
    final jsonData = {
      'user_id': deviceController.userId.value,
      'farmer_id': deviceController.farmerId.value,
      'asset_id': assetId,
      'token': deviceController.deviceToken.value,
      'device_type': deviceType,
      'language': language,
    };

    try {
      final response = await dio.post(
        ApiLinks.baseUrl + ApiLinks.setAssetDispatch,
        data: jsonData,
      );

      if (response.statusCode == 200) {
        final responseData = response.data;
        if (responseData['status'] == 'success') {
          // Update local dispatch status map
          _dispatchStatusMap[assetId] = "1"; // Mark as dispatched

          // Notify listeners of state change
          dispatchData.refresh();

          showToast('Dispatch status updated successfully.');
        } else {
          log('Failed to update dispatch status: ${responseData['message']}');
          showToast('Failed to update dispatch status.');
        }
      } else {
        log('Server error: ${response.statusCode}');
        showToast('Failed to update dispatch status.');
      }
    } catch (e) {
      log('Exception: $e');
      showToast('Failed to update dispatch status.');
    } finally {
      isLoading.value = false;
    }
  }

  String getDispatchStatus(String assetId) {
    return _dispatchStatusMap[assetId] ?? '0';
  }
}
