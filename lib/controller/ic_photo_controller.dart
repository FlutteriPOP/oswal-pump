import 'package:get/get.dart';

class IcPhotoController extends GetxController {
  final RxString selectedValue = 'no'.obs;
  final RxBool isCompleted = false.obs;

  void toggleCompleted(String value) {
    selectedValue.value = value;
    isCompleted.value = value == 'yes';
  }
}
