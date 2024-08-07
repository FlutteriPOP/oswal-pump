import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oswal/model/block_model.dart';
import 'package:oswal/model/district_model.dart';
import 'package:oswal/model/tehsil_model.dart';
import 'package:oswal/model/village_model.dart';
import 'package:oswal/pages/widgets/dropdown_widget.dart';

import '../../controller/location_controller.dart';
import '../../controller/site_survey_controller.dart';
import '../../theme/color.dart';
import '../../utils/routs.dart';
import '../widgets/appbar_widget.dart';
import '../widgets/basic_details_widget.dart';
import '../widgets/custom_button.dart';
import '../widgets/mytext_form.dart';
import '../widgets/site_photo_widget.dart';

class SiteSurveyPage extends StatelessWidget {
  const SiteSurveyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final SiteSurveyController dropdownController =
        Get.find<SiteSurveyController>();

    return Scaffold(
      appBar: const AppbarWidget(
        title: 'Site Survey',
      ),
      body: Obx(() {
        // Use Obx to listen for changes in loading state
        if (dropdownController.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.blue.withOpacity(0.1),
              color: Theme.of(context)
                  .colorScheme
                  .primary, // Optional: set the color
            ),
          );
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BasicDetailsWidget(
                isShow: true,
              ),
              const SizedBox(height: 20),
              _locationDetails(context),
              const SizedBox(height: 20),
              _pumpDetails(context),
              const SizedBox(height: 20),
              _otherDetails(context),
              const SizedBox(height: 20),
              SitePhoto(
                title: 'Site Photo',
                onTap: () {
                  Get.toNamed(AppRouts.camera);
                  log('Tapped on Site Photo');
                },
              ),
              const SizedBox(height: 20),
              SitePhoto(
                photoUrls: const [],
                title: 'Consent Form',
                onTap: () {
                  log('Tapped on Site Photo');
                },
              ),
              const SizedBox(height: 20),
              SitePhoto(
                title: 'Declaration Form',
                onTap: () {
                  log('Tapped on Declaration Form');
                },
              ),
              const SizedBox(height: 20),
              SitePhoto(
                title: 'Land Paper Form',
                onTap: () {
                  log('Tapped on Site Photo');
                },
              ),
              const SizedBox(height: 20),
              CustomButton(
                child: Text(
                  'Submit',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: Colors.white),
                ),
                onPressed: () => log('Tapped on Submit'),
              ),
            ],
          ),
        );
      }),
    );
  }
}

Widget _locationDetails(BuildContext context) {
  final LocationController locationController = Get.find<LocationController>();
  final SiteSurveyController dropdownController =
      Get.find<SiteSurveyController>();

  // Initialize controllers with initial values from the LocationController
  TextEditingController latitudeController = TextEditingController(
    text: locationController.latitude.toString(),
  );
  TextEditingController longitudeController = TextEditingController(
    text: locationController.longitude.toString(),
  );

  return DetailsContainer(
    title: 'Location Details - Hariyana',
    children: [
      Divider(
        color: Theme.of(context).colorScheme.primary,
        thickness: 1,
      ),
      const SizedBox(height: 10),
      CustomDropdown<Datum>(
        selectedValue: dropdownController.selectedDistrict,
        items: dropdownController.districtList,
        itemLabel: (datum) => datum.districtName ?? 'Unknown',
        label: 'Select District',
        onChanged: (Datum? newValue) {
          if (newValue != null) {
            dropdownController.selectedDistrict.value = newValue;
            dropdownController.clearDependentDropdowns();
            dropdownController.getTehsil(newValue.districtCode ?? '');
            dropdownController.getBlock(newValue.districtCode ?? '');
          } else {
            dropdownController.clearDependentDropdowns();
          }
        },
      ),
      const SizedBox(height: 20),
      CustomDropdown<Tehsil>(
        label: 'Tehsil',
        selectedValue: dropdownController.selectedTehsil,
        items: dropdownController.tehsilList,
        itemLabel: (tehsil) => tehsil.tehsilName ?? 'Unknown',
        onChanged: (Tehsil? newValue) {
          if (newValue != null) {
            dropdownController.selectedTehsil.value = newValue;
            dropdownController.clearBlockAndVillage();
            dropdownController.getTehsil(
              dropdownController.selectedDistrict.value?.districtCode ?? '',
            );
          } else {
            dropdownController.clearBlockAndVillage();
          }
        },
      ),
      const SizedBox(height: 20),
      CustomDropdown<Block>(
        label: 'Block',
        selectedValue: dropdownController.selectedBlock,
        items: dropdownController.blockList,
        itemLabel: (block) => block.blockName ?? 'Unknown',
        onChanged: (Block? newValue) {
          if (newValue != null) {
            dropdownController.selectedBlock.value = newValue;
            dropdownController.getBlock(newValue.blockCode ?? '');
            dropdownController.clearVillages();
          } else {
            dropdownController.clearVillages();
          }
        },
      ),
      const SizedBox(height: 20),
      CustomDropdown<Village>(
        label: 'Village',
        selectedValue: dropdownController.selectedVillage,
        items: dropdownController.villageList,
        itemLabel: (village) => village.villageName ?? 'Unknown',
        onChanged: (Village? newValue) {
          if (newValue != null) {
            dropdownController.selectedVillage.value = newValue;
            dropdownController.getVillage(
                dropdownController.selectedDistrict.value?.districtCode ?? '',
                dropdownController.selectedTehsil.value?.tehsilCode ?? '');
            dropdownController.clearVillages();
          } else {
            dropdownController.clearVillages();
          }
        },
      ),
      const SizedBox(height: 10),
      MyTextForm(
        controller: latitudeController,
        enabled: false,
        labelText: 'Latitude',
        suffixIcon: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.my_location_rounded,
            color: Theme.of(context).colorScheme.error,
          ),
        ),
      ),
      MyTextForm(
        controller: longitudeController,
        enabled: false,
        labelText: 'Longitude',
        suffixIcon: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.my_location_rounded,
            color: Theme.of(context).colorScheme.error,
          ),
        ),
      ),
      const MyTextForm(labelText: 'Survey Number'),
      const MyTextForm(labelText: 'Killa Number'),
      const MyTextForm(labelText: 'Land Coverage Area (Sq.Meter)'),
      const MyTextForm(labelText: 'Water Depth Level (ft.)'),
    ],
  );
}

Widget _pumpDetails(BuildContext context) {
  final SiteSurveyController dropdownController =
      Get.find<SiteSurveyController>();
  return DetailsContainer(
    title: 'Pump Details',
    children: [
      Divider(
        color: Theme.of(context).colorScheme.primary,
        thickness: 1,
      ),
      const SizedBox(
        height: 15,
      ),
      // CustomDropdown(
      //   label: 'Pump Capacity (Hp)',
      //   selectedValue: dropdownController.selectedDistrict,
      //   items: dropdownController.selectedDistrict,
      //   onChanged: (newValue) => dropdownController.selectedDistrict(newValue!),
      // ),
      const SizedBox(
        height: 20,
      ),
      // CustomDropdown(
      //   label: 'Pump Type',
      //   selectedValue: dropdownController.selectedTehsil,
      //   items: dropdownController.tehsil,
      //   onChanged: (newValue) => dropdownController.selectedTehsil(newValue!),
      // ),
      const SizedBox(
        height: 20,
      ),
      // CustomDropdown(
      //   label: 'Pump Sub Type',
      //   selectedValue: dropdownController.selectedVillage,
      //   items: dropdownController.village,
      //   onChanged: (newValue) => dropdownController.selectedVillage(newValue!),
      // ),
      const SizedBox(
        height: 20,
      ),
      // CustomDropdown(
      //   label: 'Pump Category',
      //   selectedValue: dropdownController.selectedBlock,
      //   items: dropdownController.block,
      //   onChanged: (newValue) => dropdownController.selectedBlock(newValue!),
      // ),
      const SizedBox(
        height: 20,
      ),
      // CustomDropdown(
      //   label: 'Controller Type',
      //   selectedValue: dropdownController.selectedBlock,
      //   items: dropdownController.block,
      //   onChanged: (newValue) => dropdownController.selectedBlock(newValue!),
      // ),
      const SizedBox(
        height: 10,
      ),
      const MyTextForm(labelText: 'Head of Pump (Meter)'),
      const MyTextForm(labelText: 'Depth of Pump to be installed (ft.)'),
    ],
  );
}

Widget _otherDetails(BuildContext context) {
  final SiteSurveyController siteSurveyController =
      Get.find<SiteSurveyController>();
  return DetailsContainer(
    title: 'Other Details',
    children: [
      Divider(
        color: Theme.of(context).colorScheme.primary,
        thickness: 1,
      ),
      const SizedBox(
        height: 15,
      ),
      // CustomDropdown(
      //   label: 'Irrigation Mode',
      //   selectedValue: dropdownController.selectedDistrict,
      //   items: dropdownController.districts,
      //   onChanged: (newValue) => dropdownController.selectedDistrict(newValue!),
      // ),
      const SizedBox(
        height: 20,
      ),
      // CustomDropdown(
      //   label: 'Source of Water',
      //   selectedValue: dropdownController.selectedTehsil,
      //   items: dropdownController.tehsil,
      //   onChanged: (newValue) => dropdownController.selectedTehsil(newValue!),
      // ),
      const SizedBox(
        height: 20,
      ),
      // CustomDropdown(
      //   label: 'Size of BoreWell (ft.)',
      //   selectedValue: dropdownController.selectedVillage,
      //   items: dropdownController.village,
      //   onChanged: (newValue) => dropdownController.selectedVillage(newValue!),
      // ),
      const SizedBox(
        height: 20,
      ),
      // CustomDropdown(
      //   label: 'Source of Power',
      //   selectedValue: dropdownController.selectedBlock,
      //   items: dropdownController.block,
      //   onChanged: (newValue) => dropdownController.selectedBlock(newValue!),
      // ),
      const SizedBox(
        height: 20,
      ),
      // CustomDropdown(
      //   label: 'Having Electric Connection at Site?',
      //   selectedValue: dropdownController.selectedBlock,
      //   items: dropdownController.block,
      //   onChanged: (newValue) => dropdownController.selectedBlock(newValue!),
      // ),
      const SizedBox(
        height: 20,
      ),
      // CustomDropdown(
      //   label: 'Is South Facing Shadow Free Land Available?',
      //   selectedValue: dropdownController.selectedBlock,
      //   items: dropdownController.block,
      //   onChanged: (newValue) => dropdownController.selectedBlock(newValue!),
      // ),
      const SizedBox(
        height: 20,
      ),
      // CustomDropdown(
      //   label: 'Is Site Suitable for Pump Installation?',
      //   selectedValue: dropdownController.selectedBlock,
      //   items: dropdownController.block,
      //   onChanged: (newValue) => dropdownController.selectedBlock(newValue!),
      // ),
      const SizedBox(
        height: 10,
      ),
      const MyTextForm(labelText: 'Remark'),
    ],
  );
}

class DetailsContainer extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const DetailsContainer({
    required this.title,
    required this.children,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error, color: primaryColor),
              const SizedBox(width: 10),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Column(
            children: children,
          ),
        ],
      ),
    );
  }
}
