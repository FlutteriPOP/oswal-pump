import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oswal/theme/color.dart';
import 'package:oswal/utils/routs.dart';

import '../../controller/search_controller.dart';
import '../../model/search_model.dart';

class SolarIdPage extends StatelessWidget {
  final SearchBarController searchController = Get.find();
  SolarIdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      // if (searchController.isLoading.value) {
      //   return const Center(child: CircularProgressIndicator());
      // }

      // if (searchController.searchResults.value == null) {
      //   return const Center(child: Text('No data available'));
      // }

      final searchResults = searchController.searchResults.value!;
      return Column(
        children: [
          _customContainerData(context, searchResults),
          const SizedBox(height: 20),
          RefreshIndicator(
            onRefresh: () => Future.delayed(const Duration(seconds: 2)),
            child: _customContainerProcess(context),
          ),
        ],
      );
    });
  }

  Widget _customContainerData(
      BuildContext context, FarmerDetailsModel searchResults) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 5,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _itemRow(
            context,
            icon: Icons.description_rounded,
            text: searchResults.applicationNo,
          ),
          _itemRow(context,
              icon: Icons.person_2_rounded, text: searchResults.farmerName),
          _itemRow(context,
              icon: Icons.phone_android_outlined, text: searchResults.mobile),
          _itemRow(context,
              icon: Icons.location_on, text: searchResults.locVillage),
          _itemRow(context,
              icon: Icons.table_view_outlined,
              text:
                  '${searchResults.irrigationMode} - ${searchResults.waterDepthFt} ft - ${searchResults.sourceOfWater}'),
        ],
      ),
    );
  }

  Widget _itemRow(BuildContext context,
      {required IconData icon, required String text}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(icon, color: Theme.of(context).colorScheme.onSurface, size: 25),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
        ),
      ],
    );
  }

  Widget _customContainerProcess(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        children: [
          _customSurvey(context,
              onTap: () => {
                    Get.toNamed(AppRouts.siteSurvey),
                    log('tapped on site survey')
                  },
              color: primaryColorDark,
              color2: const Color.fromARGB(255, 190, 249, 218),
              icon: Icons.pin_drop_sharp,
              text: 'Site Survey'),
          _customSurvey(context,
              onTap: () => {
                    Get.toNamed(AppRouts.dispatch),
                    // Get.toNamed(AppRouts.solarDetails),
                    log('tapped on solar Dispatch'),
                  },
              color: Colors.purple,
              color2: const Color.fromARGB(255, 249, 218, 255),
              icon: Icons.local_shipping,
              text: 'Dispatch'),
          _customSurvey(context,
              onTap: () => {
                    Get.toNamed(AppRouts.assetMapping),
                    log('Tap on asset mapping'),
                  },
              color: Colors.red,
              color2: const Color.fromARGB(255, 254, 202, 199),
              icon: Icons.qr_code_scanner_rounded,
              text: 'Asset Mapping'),
          _customSurvey(context,
              onTap: () => {
                    Get.toNamed(AppRouts.icPhotos),
                    log('Tap on i&c photos'),
                  },
              color2: const Color(0xffffccbc),
              color: const Color(0xffbf360c),
              icon: Icons.construction,
              text: 'I&C Photos'),
        ],
      ),
    );
  }

  Widget _customSurvey(BuildContext context,
      {required String text,
      required IconData icon,
      required Color color,
      required Color color2,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
            color: color2,
            border: Border.all(color: color, width: 2),
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(3, 10),
              ),
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 30),
            const SizedBox(width: 10),
            Text(
              text,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: color,
                    overflow: TextOverflow.ellipsis,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
