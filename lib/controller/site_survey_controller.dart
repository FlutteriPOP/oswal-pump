import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../model/block_model.dart';
import '../model/district_model.dart';
import '../model/tehsil_model.dart';
import '../model/village_model.dart';
import '../utils/apis.dart';
import '../utils/const.dart';
import 'device_storage_controller.dart';

class SiteSurveyController extends GetxController {
  final DeviceController deviceController = Get.find();
  var isLoading = false.obs;
  var districtList = <Datum>[].obs;
  var tehsilList = <Tehsil>[].obs;
  var blockList = <Block>[].obs;
  var villageList = <Village>[].obs;
  var pumpType = <String>['AC', 'DC'].obs;
  var pumpSubType = <String>['Submersible', 'Surface'].obs;
  var pumpCapacity = <String>['1', '2', '3', '4', '5', '6', '7.5', '10'].obs;
  var pumpCategory = <String>['WaterFilled', 'OilFilled'].obs;
  var controllerType = <String>['Normal', 'USPC'].obs;
  var irrigationMode =
      <String>['UGPL', 'Sprinkler', 'Drip Irrigation', 'Open Irrigation'].obs;
  var sourceOfWater = <String>[
    'BoreWell',
    'Pond',
    'River',
    'OpenWall',
    'TubWell',
    'Canal',
    'Other'
  ].obs;

  var sourceOfPower = ['Diesel', 'Electric', 'Gen-Set', 'Canal', 'Other'].obs;
  var haveElectricConnection = ['NotApplied', 'Yes', 'InProcess'].obs;
  var isSouthFacingShadow = ['Yes', 'No'].obs;
  var isSiteSuitableForPump = ['Yes', 'No'].obs;

  var selectedPumpCategory = Rx<String?>(null);
  var selectedPumpSubType = Rx<String?>(null);
  var selectedPumpType = Rx<String?>(null);
  var selectedPumpCapacity = Rx<String?>(null);
  var selectedControllerType = Rx<String?>(null);
  var selectedIrrigationMode = Rx<String?>(null);
  var selectedSourceOfWater = Rx<String?>(null);
  var selectedSourceOfPower = Rx<String?>(null);
  var selectedHaveElectricConnection = Rx<String?>(null);
  var selectedIsSouthFacingShadow = Rx<String?>(null);
  var selectedIsSiteSuitableForPump = Rx<String?>(null);

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

  void clearBlock() {
    selectedBlock.value = null;
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
