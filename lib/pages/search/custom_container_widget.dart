import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/getgodown_controller.dart';
import '../../model/getgodown_model.dart';
import '../../utils/routs.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final GetgodownController getgodownController = Get.find();

    return Obx(() {
      if (getgodownController.isLoading.value) {
        return const Center(child: CircularProgressIndicator.adaptive());
      }

      GetGodownModel? godownData = getgodownController.godownData.first;

      return GestureDetector(
        onTap: () {
          Get.toNamed(AppRouts.solarDetails);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: colorScheme.onSurface,
              width: 2,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildHeader(godownData.godownName!, colorScheme, textTheme),
              _buildDivider(colorScheme),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildAssetInfoCard(
                    'Available Assets',
                    godownData.availableAssetQty ?? [],
                    colorScheme,
                    textTheme,
                  ),
                  _verticalDivider(),
                  _buildAssetInfoCard(
                    'Spare Assets',
                    godownData.spareAssetQty ?? [],
                    colorScheme,
                    textTheme,
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildHeader(
    String godownName,
    ColorScheme colorScheme,
    TextTheme textTheme,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.engineering,
          color: colorScheme.onSurface,
          size: 30,
        ),
        const SizedBox(width: 10),
        Text(
          godownName,
          style:
              textTheme.headlineMedium?.copyWith(color: colorScheme.onSurface),
        ),
      ],
    );
  }

  Widget _buildDivider(ColorScheme colorScheme) {
    return Divider(
      color: colorScheme.onSurface,
      thickness: 1,
      endIndent: 10,
      indent: 10,
    );
  }

  Widget _buildAssetInfoCard(
    String title,
    List<AssetQty> assetQtyList,
    ColorScheme colorScheme,
    TextTheme textTheme,
  ) {
    final assetMap = {
      'Pump': '0',
      'Solar Panel': '0',
      'Motor': '0',
      'Modules': '0',
    };

    for (var asset in assetQtyList) {
      assetMap[asset.assetName!] = asset.count!;
    }

    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: colorScheme.surfaceContainerHighest.withOpacity(0.1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                title,
                style: textTheme.titleLarge?.copyWith(
                  color: colorScheme.onSurface,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            _rowDivider(),
            const SizedBox(height: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Pumps: ${assetMap['Pump']}',
                  style: textTheme.bodyMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  'Motors: ${assetMap['Motor']}',
                  style: textTheme.bodyMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  'Controllers: ${assetMap['Controller'] ?? '0'}',
                  style: textTheme.bodyMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  'Solar Panel: ${assetMap['Solar Panel']}',
                  style: textTheme.bodyMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _rowDivider() {
    return Container(
      height: 1,
      width: double.infinity,
      color: Colors.grey,
    );
  }

  Widget _verticalDivider() {
    return SizedBox(
      height: MediaQuery.of(Get.context!).size.height * 0.12,
      child: Container(
        width: 1,
        color: Colors.grey,
      ),
    );
  }
}
