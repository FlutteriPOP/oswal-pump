import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oswal/theme/color.dart';
import 'package:oswal/utils/routs.dart';

import '../../controller/search_controller.dart';
import '../../model/search_model.dart';

class FarmerDetailPage extends StatelessWidget {
  final SearchBarController searchController = Get.find();

  FarmerDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      // Handle loading and error states if needed
      if (searchController.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      final searchResults = searchController.searchResults.value;
      if (searchResults == null) {
        return const Center(child: Text('No data available'));
      }

      return Column(
        children: [
          _customContainerData(context, searchResults),
          const SizedBox(height: 20),
          RefreshIndicator(
            onRefresh: () async {
              // Implement your refresh logic here
              await Future.delayed(const Duration(seconds: 2));
            },
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _itemRow(
            context,
            icon: Icons.description_rounded,
            text: searchResults.applicationNo,
          ),
          _itemRow(
            context,
            icon: Icons.person_2_rounded,
            text: searchResults.farmerName,
          ),
          _itemRow(
            context,
            icon: Icons.phone_android_outlined,
            text: searchResults.mobile,
          ),
          _itemRow(
            context,
            icon: Icons.location_on,
            text: '${searchResults.locVillage}, ${searchResults.locDistrict}',
          ),
          _itemRow(
            context,
            icon: Icons.table_view_outlined,
            text:
                '${searchResults.pumpCapacity} HP ${searchResults.pumpType}, ${searchResults.pumpSubType}',
          ),
        ],
      ),
    );
  }

  Widget _itemRow(BuildContext context,
      {required IconData icon, required String text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(icon, color: Theme.of(context).colorScheme.primary, size: 25),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontWeight: FontWeight.normal),
            ),
          ),
        ],
      ),
    );
  }

  Widget _customContainerProcess(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(15),
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
          _customSurvey(
            context,
            text: 'Site Survey',
            icon: Icons.pin_drop_sharp,
            color: primaryColorDark,
            color2: const Color.fromARGB(255, 190, 249, 218),
            onTap: () {
              Get.toNamed(AppRouts.siteSurvey);
              log('Tapped on site survey');
            },
          ),
          _customSurvey(
            context,
            text: 'Dispatch',
            icon: Icons.local_shipping,
            color: Colors.purple,
            color2: const Color.fromARGB(255, 249, 218, 255),
            onTap: () {
              Get.toNamed(AppRouts.dispatch);
              log('Tapped on solar dispatch');
            },
          ),
          _customSurvey(
            context,
            text: 'Asset Mapping',
            icon: Icons.qr_code_scanner_rounded,
            color: Colors.red,
            color2: const Color.fromARGB(255, 254, 202, 199),
            onTap: () {
              Get.toNamed(AppRouts.assetMapping);
              log('Tapped on asset mapping');
            },
          ),
          _customSurvey(
            context,
            text: 'I&C Photos',
            icon: Icons.construction,
            color: const Color(0xffbf360c),
            color2: const Color(0xffffccbc),
            onTap: () {
              Get.toNamed(AppRouts.icPhotos);
              log('Tapped on I&C photos');
            },
          ),
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
          ],
        ),
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
