import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:oswal/controller/device_storage_controller.dart';
import 'package:oswal/utils/apis.dart';
import 'package:oswal/utils/routs.dart';

import '../pages/widgets/tost_widget.dart';

class LoginController extends GetxController {
  final DeviceController deviceController = Get.find();
  final Dio dio = Dio();
  final RxBool isObscure = true.obs;
  final RxBool isLoading = false.obs;

  void toggleVisibility() {
    isObscure.value = !isObscure.value;
  }

  Future<void> login({
    required String email,
    required String password,
    String? token,
  }) async {
    final deviceToken = deviceController.deviceToken.value;

    final data = {
      'username': email,
      'password': password,
      'token': token ?? deviceToken,
    };

    try {
      isLoading.value = true;
      final response = await dio.post(
        '${ApiLinks.baseUrl}${ApiLinks.login}',
        data: data,
      );

      if (response.statusCode == 200) {
        log('Login successful!');
        log('Response data type: ${response.data.runtimeType}');
        log('Response data: ${response.data}');

        final responseData = response.data;

        if (responseData is Map && responseData['data'] is List) {
          final dataList = responseData['data'] as List;

          if (dataList.isNotEmpty && dataList[0] is Map<String, dynamic>) {
            final firstData = dataList[0] as Map<String, dynamic>;

            final userId = firstData['user_id']?.toString() ?? '';

            if (userId.isNotEmpty) {
              deviceController.saveUserId(userId);
              showToast('Login successful!');
              Get.offAllNamed(AppRouts.home);
              log('User ID: $userId');
            } else {
              showToast('User ID is missing in response');
              log('User ID is missing in response data');
            }
          } else {
            showToast('Invalid data format in response');
            log('Invalid data format in response data');
          }
        } else {
          showToast('Invalid data format in response');
          log('Invalid data format in response data');
        }
      } else {
        showToast(response.data['message'] ?? 'Login failed');
        log('Login failed! Status code: ${response.statusCode}');
        log('Response data: ${response.data}');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        log('Dio error! Status code: ${e.response?.statusCode}');
        showToast(e.response?.data['message'] ?? 'An error occurred');
        log('Response data: ${e.response?.data}');
      } else {
        log('Dio error! No response data');
        showToast('Network error, please try again later');
      }
      log('Error: ${e.message}');
    } catch (e) {
      log('Unexpected error: ${e.toString()}');
      showToast('An unexpected error occurred');
    } finally {
      isLoading.value = false;
    }
  }
}
