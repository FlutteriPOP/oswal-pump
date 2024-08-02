import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:oswal/controller/device_storage_controller.dart';

import '../model/search_model.dart';
import '../utils/apis.dart';

class SearchBarController extends GetxController {
  final DeviceController deviceController = Get.find();
  final searchText = ''.obs;
  final RxBool isLoading = false.obs;
  final searchResults = Rxn<FarmerDetailsModel>();
  Dio dio = Dio();

  void updateSearchText(String value) {
    searchText.value = value;
  }

  Future<void> searchFarmer({required String searchText}) async {
    deviceController.loadUserId();
    final userId = deviceController.userId.value;

    final data = {
      'user_id': userId,
      'project_id': '1',
      'applicationno': searchText,
    };

    try {
      isLoading(true);
      final response = await dio.post(
        '${ApiLinks.baseUrl}${ApiLinks.searchfarmer}',
        data: data,
      );

      if (response.statusCode == 200) {
        log(response.data.toString());
        searchResults.value =
            FarmerDetailsModel.fromJson(response.data['data'][0]);
      } else {
        log(response.data.toString());
        searchResults.value = null;
      }
    } catch (e) {
      log(e.toString());
      searchResults.value = null;
    } finally {
      isLoading(false);
    }
  }
}
