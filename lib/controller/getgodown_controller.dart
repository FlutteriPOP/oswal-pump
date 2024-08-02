import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:oswal/controller/device_storage_controller.dart';
import 'package:oswal/model/getgodown_model.dart';
import 'package:oswal/utils/apis.dart';

class GetgodownController extends GetxController {
  final DeviceController deviceController = Get.find();
  final RxBool isLoading = false.obs;
  final RxList<GetGodownModel> godownData = <GetGodownModel>[].obs;
  Dio dio = Dio();

  @override
  void onInit() {
    super.onInit();
    getGodown();
  }

  Future<void> getGodown() async {
    deviceController.loadDeviceId();
    deviceController.loadUserId();
    final token = deviceController.deviceId.value;
    final userId = deviceController.userId.value;

    isLoading.value = true;

    final data = {
      'user_id': userId,
      'token': token,
      'device_type': 'android',
      'language': 'en'
    };

    try {
      final response = await dio.post(
        '${ApiLinks.baseUrl}${ApiLinks.getGodown}',
        data: data,
      );

      if (response.statusCode == 200) {
        log('Response data: ${response.data}');
        godownData.value = (response.data['data'] as List)
            .map((item) => GetGodownModel.fromJson(item))
            .toList();
      } else {
        log('Request failed with status code: ${response.statusCode}');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        log('Dio error! Status code: ${e.response?.statusCode}');
        log('Response data: ${e.response?.data}');
      } else {
        log('Dio error! No response data');
        log('Error message: ${e.message}');
      }
    } catch (e) {
      log('Unexpected error: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
