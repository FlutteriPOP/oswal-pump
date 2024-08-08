import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oswal/controller/dispatch_controller.dart';

import '../controller/asset_mapping_controller.dart';
import '../controller/getgodown_controller.dart';
import '../controller/godown_detail_controller.dart';
import '../controller/ic_photo_controller.dart';
import '../controller/location_controller.dart';
import '../controller/login_controller.dart';
import '../controller/search_controller.dart';
import '../controller/site_survey_controller.dart';

class AllBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchBarController>(() => SearchBarController(), fenix: true);
    Get.lazyPut<SiteSurveyController>(() => SiteSurveyController(),
        fenix: true);
    Get.lazyPut<AssetMappingController>(() => AssetMappingController(),
        fenix: true);
    Get.lazyPut<LoginController>(() => LoginController(), fenix: true);
    Get.lazyPut<IcPhotoController>(() => IcPhotoController(), fenix: true);
    Get.lazyPut<GetgodownController>(() => GetgodownController(), fenix: true);
    Get.lazyPut<SearchController>(() => SearchController(), fenix: true);

    Get.lazyPut<GodownDetailController>(() => GodownDetailController(),
        fenix: true);
    Get.lazyPut<DispatchController>(() => DispatchController(), fenix: true);
    Get.put<LocationController>(LocationController(), permanent: true);
  }
}
