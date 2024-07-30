import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:oswal/pages/widgets/tost_widget.dart';

import '../utils/apis.dart';

class ForgotController extends GetxController {
  final RxBool isLoading = false.obs;
  final Dio dio = Dio();

  Future<void> forgotPassword({required String email}) async {
    final data = {"email": email};
    const url = '${ApiLinks.baseUrl}${ApiLinks.forgetPass}'; // Form the URL
    try {
      isLoading.value = true;
      log('Making request to: $url'); // Log the URL

      final response = await dio.post(url, data: data);

      if (response.statusCode == 200) {
        log('Password reset successful: ${response.data}');
        Get.back();
      } else {
        log('Password reset failed: Status code ${response.statusCode}, Response data: ${response.data}');
      }
    } on DioException catch (dioError) {
      if (dioError.response != null) {
        log('Dio error: Status code ${dioError.response?.statusCode}, Response data: ${dioError.response?.data}');

        showToast('Something went wrong!}');
      } else {
        log('Dio error: ${dioError.message}');
      }
    } catch (e) {
      log('Unexpected error: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
