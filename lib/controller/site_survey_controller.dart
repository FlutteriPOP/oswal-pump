import 'package:get/get.dart';

class SiteSurveyController extends GetxController {
  // Dropdown values for different dropdowns
  RxString selectedTehsil = 'Select Tehsil'.obs;
  RxString selectedVillage = 'Select Village'.obs;
  RxString selectedDistrict = 'Select District'.obs;
  RxString selectedBlock = 'Select Block'.obs;

  // Lists of options for each dropdown
  List<String> tehsil = ['Tehsil 1', 'Tehsil 2', 'Tehsil 3'];
  List<String> village = ['Village 1', 'Village 2', 'Village 3'];
  List<String> district = ['District 1', 'District 2', 'District 3'];
  List<String> block = ['Block 1', 'Block 2', 'Block 3'];

  // Methods to update selected values
  void setTehsil(String value) {
    selectedTehsil.value = value;
  }

  void setVillage(String value) {
    selectedVillage.value = value;
  }

  void setDistrict(String value) {
    selectedDistrict.value = value;
  }

  void setBlock(String value) {
    selectedBlock.value = value;
  }

  // getting location from api
}
