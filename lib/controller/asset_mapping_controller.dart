import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:get/get.dart';
import 'package:oswal/pages/widgets/tost_widget.dart';


class AssetMappingController extends GetxController {
  final RxBool isPumpExpanded = false.obs;
  final RxBool isMotorExpanded = false.obs;
  final RxBool isControllerExpanded = false.obs;
  final RxBool isSolarPanelExpanded = false.obs;

  final RxBool isPumpManualInput = false.obs;
  final RxBool isMotorManualInput = false.obs;
  final RxBool isControllerManualInput = false.obs;
  final RxBool isSolarPanelManualInput = false.obs;

  void toggleExpanded(String section) {
    switch (section) {
      case 'Pump':
        isPumpExpanded.value = !isPumpExpanded.value;
        break;
      case 'Motor':
        isMotorExpanded.value = !isMotorExpanded.value;
        break;
      case 'Controller':
        isControllerExpanded.value = !isControllerExpanded.value;
        break;
      case 'Solar Panel':
        isSolarPanelExpanded.value = !isSolarPanelExpanded.value;
        break;
    }
  }

  void toggleManualInput(String section) {
    switch (section) {
      case 'Pump':
        isPumpManualInput.value = !isPumpManualInput.value;
        break;
      case 'Motor':
        isMotorManualInput.value = !isMotorManualInput.value;
        break;
      case 'Controller':
        isControllerManualInput.value = !isControllerManualInput.value;
        break;
      case 'Solar Panel':
        isSolarPanelManualInput.value = !isSolarPanelManualInput.value;
        break;
    }
  }

  Future<void> handleScan() async {
    // Placeholder for future API interaction to handle scanning
    var result = await BarcodeScanner.scan();

    // showToast(result.type.toString());
    if (result.rawContent.isNotEmpty) {
      showToast(result.rawContent);
    }
    // log(result.format.toString());
    // log(result.formatNote);
  }

  Future<void> handleManualInput(String input) async {
    // Placeholder for future API interaction to handle manual input
  }
}
