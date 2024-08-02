import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:oswal/pages/widgets/tost_widget.dart';
import 'package:oswal/utils/apis.dart';

import '../model/getdown_detail_model.dart';
import 'device_storage_controller.dart';

class GodownDetailController extends GetxController {
  final DeviceController deviceController = Get.find();
  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;

  Dio dio = Dio();

  RxList<GetDownDetailModel> data = <GetDownDetailModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    final token = deviceController.deviceId.value;
    final userId = deviceController.userId.value;

    final requestData = {
      'user_id': userId,
      'type': 'Installer',
      'id': userId,
      'token': token,
      'device_type': 'android',
      'language': 'en'
    };

    try {
      isLoading.value = true;
      final response = await dio.post(
        ApiLinks.baseUrl + ApiLinks.getGodownDetails,
        data: requestData,
      );

      if (response.statusCode == 200) {
        if (response.data is Map<String, dynamic>) {
          GetDownDetailModel fetchedResponse =
              GetDownDetailModel.fromJson(response.data);
          data.clear();
          data.add(fetchedResponse);
          isLoading.value = false;

          log('Data fetched successfully: ${response.data}');
        } else {
          errorMessage.value = 'Unexpected response format';
          log('Unexpected response format: ${response.data}');
        }
      } else {
        showToast('Something went wrong');
        errorMessage.value = 'Error: ${response.statusCode}';
        log('HTTP Error: ${response.statusCode} - ${response.data}');
      }
    } catch (e) {
      log('Fetch error: $e');
      errorMessage.value = 'Error: $e';
    }
  }
}
