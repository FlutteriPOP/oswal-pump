import 'package:get/get.dart';

class SearchBarController extends GetxController {
  final searchText = ''.obs;


   updateSearchText(String value) {
    searchText.value = value;
  }
}
