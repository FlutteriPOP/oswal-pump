import 'package:get/get.dart';

import '../controller/asset_mapping_controller.dart';
import '../controller/dropdown_controller.dart';
import '../controller/ic_photo_controller.dart';
import '../controller/login_controller.dart';
import '../controller/search_controller.dart';

class AllBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchBarController>(() => SearchBarController(), fenix: true);
    Get.lazyPut<DropdownController>(() => DropdownController(), fenix: true);
    Get.lazyPut<AssetMappingController>(() => AssetMappingController(),
        fenix: true);
    Get.lazyPut<LoginController>(() => LoginController(), fenix: true);
    Get.lazyPut<IcPhotoController>(() => IcPhotoController(), fenix: true);
  }
}
