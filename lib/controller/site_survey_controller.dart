import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:oswal/controller/device_storage_controller.dart';
import 'package:oswal/model/block_model.dart';
import 'package:oswal/model/tehsil_model.dart';
import 'package:oswal/model/village_model.dart';
import 'package:oswal/utils/apis.dart';
import 'package:oswal/utils/const.dart';

import '../model/district_model.dart';

class SiteSurveyController extends GetxController {
  final DeviceController deviceController = Get.find();
  var isLoading = false.obs;
  var districtList = <Datum>[].obs;
  var tehsilList = <Tehsil>[].obs;
  var blockList = <Block>[].obs;
  var villageList = <Village>[].obs;
  var selectedDistrict = Rxn<Datum>();
  var selectedTehsil = Rxn<Tehsil>();
  var selectedBlock = Rxn<Block>();
  var selectedVillage = Rxn<Village>();
  var districtModel = Rx<DistrictModel?>(null);
  var tehsilModel = Rx<TehsilModel?>(null);
  var blockModel = Rx<BlockModel?>(null);
  var villageModel = Rx<VillageModel?>(null);
  var errorMessage = ''.obs;

  final Dio dio = Dio();

  @override
  void onInit() {
    super.onInit();
    getDistrict();
  }

  void clearDependentDropdowns() {
    tehsilList.clear();
    selectedTehsil.value = null;
    blockList.clear();
    selectedBlock.value = null;
    villageList.clear();
    selectedVillage.value = null;
  }

  void clearBlockAndVillage() {
    blockList.clear();
    selectedBlock.value = null;
    villageList.clear();
    selectedVillage.value = null;
  }

  void clearVillages() {
    villageList.clear();
    selectedVillage.value = null;
  }

  Future<void> getDistrict() async {
    final token = deviceController.deviceToken.value;
    final userId = deviceController.userId.value;

    final data = {
      'user_id': userId,
      'state_id': stateId,
      'token': token,
      'device_type': deviceType,
      'language': language,
    };

    isLoading(true);
    errorMessage(''); // Reset error message

    try {
      final response = await dio.post(
        ApiLinks.baseUrl + ApiLinks.getdistrict,
        data: data,
      );

      if (response.statusCode == 200) {
        log('District Response: ${response.data}');
        districtModel.value = DistrictModel.fromJson(response.data);
        districtList.assignAll(districtModel.value?.data ?? []);
      } else {
        errorMessage(
            'Error: ${response.statusCode} - ${response.statusMessage}');
        log('Error: ${response.statusCode} - ${response.statusMessage}');
      }
    } catch (e) {
      errorMessage('Exception: $e');
      log('Exception: $e');
    } finally {
      isLoading(false);
    }
  }

  Future<void> getTehsil(String districtCode) async {
    final token = deviceController.deviceToken.value;
    final userId = deviceController.userId.value;

    final data = {
      'user_id': userId,
      'state_id': stateId,
      'token': token,
      'district_id': districtCode,
      'device_type': deviceType,
      'language': language,
    };

    isLoading(true);
    errorMessage(''); // Reset error message

    try {
      final response = await dio.post(
        ApiLinks.baseUrl + ApiLinks.gettehsil,
        data: data,
      );

      if (response.statusCode == 200) {
        log('Tehsil Response: ${response.data}');
        tehsilModel.value = TehsilModel.fromJson(response.data);
        tehsilList.assignAll(tehsilModel.value?.data ?? []);
      } else {
        errorMessage(
            'Error: ${response.statusCode} - ${response.statusMessage}');
        log('Error: ${response.statusCode} - ${response.statusMessage}');
      }
    } catch (e) {
      errorMessage('Exception: $e');
      log('Exception: $e');
    } finally {
      isLoading(false);
    }
  }

  Future<void> getBlock(String districtCode) async {
    final token = deviceController.deviceToken.value;
    final userId = deviceController.userId.value;

    final data = {
      'user_id': userId,
      'state_id': stateId,
      'token': token,
      'district_id': districtCode,
      'device_type': deviceType,
      'language': language,
    };

    isLoading(true);
    errorMessage(''); // Reset error message

    try {
      final response = await dio.post(
        ApiLinks.baseUrl + ApiLinks.getblock,
        data: data,
      );

      if (response.statusCode == 200) {
        log('Block Response: ${response.data}');
        blockModel.value = BlockModel.fromJson(response.data);
        blockList.assignAll(blockModel.value?.data ?? []);
      } else {
        errorMessage(
            'Error: ${response.statusCode} - ${response.statusMessage}');
        log('Error: ${response.statusCode} - ${response.statusMessage}');
      }
    } catch (e) {
      errorMessage('Exception: $e');
      log('Exception: $e');
    } finally {
      isLoading(false);
    }
  }

  Future<void> getVillage(String districtCode, String tehsilCode) async {
    final token = deviceController.deviceToken.value;
    final userId = deviceController.userId.value;

    final data = {
      'user_id': userId,
      'token': token,
      'state_id': stateId,
      'district_id': districtCode,
      'tehsil_id': tehsilCode,
      'device_type': deviceType,
      'language': language,
    };

    isLoading(true);
    errorMessage(''); // Reset error message

    try {
      final response = await dio.post(
        ApiLinks.baseUrl + ApiLinks.getvillage,
        data: data,
      );

      if (response.statusCode == 200) {
        log('Village Response: ${response.data}');
        villageModel.value = VillageModel.fromJson(response.data);
        villageList.assignAll(villageModel.value?.data ?? []);
      } else {
        errorMessage(
            'Error: ${response.statusCode} - ${response.statusMessage}');
        log('Error: ${response.statusCode} - ${response.statusMessage}');
      }
    } catch (e) {
      errorMessage('Exception: $e');
      log('Exception: $e');
    } finally {
      isLoading(false);
    }
  }
}
