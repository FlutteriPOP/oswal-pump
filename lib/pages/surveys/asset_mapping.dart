import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oswal/pages/widgets/appbar_widget.dart';
import 'package:oswal/theme/color.dart';

import '../../controller/asset_mapping_controller.dart';
import '../widgets/basic_details_widget.dart';

class AssetMappingPage extends StatelessWidget {
  const AssetMappingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AssetMappingController>();

    return Scaffold(
      appBar: const AppbarWidget(title: 'Asset Mapping'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            const BasicDetailsWidget(
              pumpNumber: 'SWPS/2023/0073',
              personName: 'MAMAN CHAND',
              phoneNumber: '+919999999999',
              address: 'Putthi Mangalkhan(136),HISAR',
              description: '3 HP DC, Surface',
            ),
            const SizedBox(height: 15),
            _buildScannerSection(
              context,
              section: 'Pump',
              color: primaryColorDark,
              color2: const Color.fromARGB(255, 226, 255, 227),
              text: 'Pump',
              onScanTap: () => controller.handleScan(),
              onManualTap: () => controller.toggleManualInput('Pump'),
            ),
            const SizedBox(height: 15),
            _buildScannerSection(
              context,
              section: 'Motor',
              color: Colors.purple,
              color2: const Color.fromARGB(255, 251, 227, 255),
              text: 'Motor',
              onScanTap: () => controller.handleScan(),
              onManualTap: () => controller.toggleManualInput('Motor'),
            ),
            const SizedBox(height: 15),
            _buildScannerSection(
              context,
              section: 'Controller',
              color: Colors.red,
              color2: const Color.fromARGB(255, 255, 230, 229),
              text: 'Controller',
              onScanTap: () => controller.handleScan(),
              onManualTap: () => controller.toggleManualInput('Controller'),
            ),
            const SizedBox(height: 15),
            _buildScannerSection(
              context,
              section: 'Solar Panel',
              color: const Color(0xffbf360c),
              color2: const Color(0xffffccbc),
              text: 'Solar Panel',
              onScanTap: () => controller.handleScan(),
              onManualTap: () => controller.toggleManualInput('Solar Panel'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScannerSection(
    BuildContext context, {
    required String section,
    required Color color,
    required Color color2,
    required String text,
    required VoidCallback onScanTap,
    required VoidCallback onManualTap,
  }) {
    final AssetMappingController controller =
        Get.find<AssetMappingController>();

    return GestureDetector(
      onTap: () => controller.toggleExpanded(section),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          border: Border.all(color: color),
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.surface,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 8,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Obx(
          () {
            final bool isExpanded = _getExpandedState(controller, section);
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Spacer(),
                    Text(
                      text,
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(color: color),
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.edit,
                          color: Colors.black87, size: 25),
                      onPressed: () => controller.toggleExpanded(section),
                    ),
                  ],
                ),
                if (isExpanded)
                  _buildScannerOptions(
                    context,
                    section: section,
                    color: color,
                    color2: color2,
                    onScanTap: onScanTap,
                    onManualTap: onManualTap,
                  ),
              ],
            );
          },
        ),
      ),
    );
  }

  bool _getExpandedState(AssetMappingController controller, String section) {
    switch (section) {
      case 'Pump':
        return controller.isPumpExpanded.value;
      case 'Motor':
        return controller.isMotorExpanded.value;
      case 'Controller':
        return controller.isControllerExpanded.value;
      case 'Solar Panel':
        return controller.isSolarPanelExpanded.value;
      default:
        return false;
    }
  }

  Widget _buildScannerOptions(
    BuildContext context, {
    required String section,
    required Color color,
    required Color color2,
    required VoidCallback onScanTap,
    required VoidCallback onManualTap,
  }) {
    final AssetMappingController controller =
        Get.find<AssetMappingController>();

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildScannerOptionButton(
              context,
              color: color,
              color2: color2,
              onTap: onScanTap,
              icon: Icons.qr_code_scanner_sharp,
              text: 'Scan',
            ),
            const SizedBox(width: 10),
            _buildScannerOptionButton(
              context,
              color: color,
              color2: color2,
              onTap: onManualTap,
              icon: Icons.keyboard,
              text: 'Manually',
            ),
          ],
        ),
        const SizedBox(height: 10),
        Obx(
          () {
            final bool isManualInput =
                _getManualInputState(controller, section);
            if (isManualInput) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: TextFormField(
                  cursorColor: color,
                  decoration: InputDecoration(
                    labelText: 'Enter details manually',
                    labelStyle: TextStyle(color: color),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: color),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: color),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: color),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.send_rounded, color: color, size: 30),
                    ),
                  ),
                  onFieldSubmitted: (input) =>
                      controller.handleManualInput(input),
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }

  bool _getManualInputState(AssetMappingController controller, String section) {
    switch (section) {
      case 'Pump':
        return controller.isPumpManualInput.value;
      case 'Motor':
        return controller.isMotorManualInput.value;
      case 'Controller':
        return controller.isControllerManualInput.value;
      case 'Solar Panel':
        return controller.isSolarPanelManualInput.value;
      default:
        return false;
    }
  }

  Widget _buildScannerOptionButton(
    BuildContext context, {
    required Color color,
    required Color color2,
    required VoidCallback onTap,
    required IconData icon,
    required String text,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: color2,
          border: Border.all(color: color, width: 2),
        ),
        child: Row(
          children: [
            Icon(icon, color: color),
            const SizedBox(width: 10),
            Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: color),
            ),
          ],
        ),
      ),
    );
  }
}
