import 'dart:async'; // Import this for Timer
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:oswal/controller/device_storage_controller.dart';
import 'package:oswal/pages/widgets/tost_widget.dart';

import '../model/search_model.dart';
import '../utils/apis.dart';

class SearchBarController extends GetxController {
  final DeviceController deviceController = Get.find();
  final searchText = ''.obs;
  final isLoading = false.obs;
  final searchResults = Rxn<FarmerDetailsModel>();
  Dio dio = Dio();

  Timer? _debounce;

  void updateSearchText(String value) {
    searchText.value = value;
    _onSearchTextChanged(value);
  }

  void _onSearchTextChanged(String searchText) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      searchFarmer(searchText: searchText);
    });
  }

  Future<void> searchFarmer({required String searchText}) async {
    deviceController.loadUserId();
    final userId = deviceController.userId.value;

    if (userId.isEmpty) {
      log('Error: userId is null or empty');
      searchResults.value = null;
      return;
    }

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
        final responseData = response.data;
        log('Response: $responseData');

        if (responseData['status'] == 'success') {
          final dataList = responseData['data'] as List<dynamic>;
          if (dataList.isNotEmpty) {
            final farmerList = dataList
                .map((item) =>
                    FarmerDetailsModel.fromJson(item as Map<String, dynamic>))
                .toList();
            searchResults.value =
                farmerList.isNotEmpty ? farmerList.first : null;
          } else {
            searchResults.value = null;
            showToast('No data found.');
          }
        } else {
          log('Error: ${responseData['message']}');
          searchResults.value = null;
          showToast(responseData['message']);
        }
      } else {
        log('Unexpected response: ${response.statusCode} - ${response.data}');
        searchResults.value = null;
        showToast('Unexpected server error.');
      }
    } catch (e) {
      log('Error occurred while searching farmer: ${e.toString()}');
      searchResults.value = null;
      showToast('An error occurred: ${e.toString()}');
    } finally {
      isLoading(false);
    }
  }
}
