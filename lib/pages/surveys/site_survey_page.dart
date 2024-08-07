import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oswal/model/block_model.dart';
import 'package:oswal/model/district_model.dart';
import 'package:oswal/model/tehsil_model.dart';
import 'package:oswal/model/village_model.dart';

import '../../controller/location_controller.dart';
import '../../controller/site_survey_controller.dart';
import '../../theme/color.dart';
import '../../utils/routs.dart';
import '../widgets/appbar_widget.dart';
import '../widgets/basic_details_widget.dart';
import '../widgets/custom_button.dart';
import '../widgets/dropdown_widget.dart';
import '../widgets/my_circular_widget.dart';
import '../widgets/mytext_form.dart';
import '../widgets/site_photo_widget.dart';

class SiteSurveyPage extends StatelessWidget {
  const SiteSurveyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final SiteSurveyController siteSurveyController =
        Get.find<SiteSurveyController>();

    return Scaffold(
      appBar: const AppbarWidget(
        title: 'Site Survey',
      ),
      body: Obx(() {
        // Use Obx to listen for changes in loading state
        if (siteSurveyController.isLoading.value) {
          return const Center(
            child: MyCircularProgressWidget(
              loadingMessage: 'Please wait...',
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
                photoUrls: const [
                  'https://cdn2.thecatapi.com/images/2vr.jpg',
                  'https://cdn2.thecatapi.com/images/4gm.gif',
                  'https://cdn2.thecatapi.com/images/6lh.jpg',
                  'https://cdn2.thecatapi.com/images/73d.jpg',
                  'https://cdn2.thecatapi.com/images/cbj.jpg'
                ],
                title: 'Site Photo',
                onTap: () {
                  Get.toNamed(AppRouts.camera);
                  log('Tapped on Site Photo');
                },
              ),
              const SizedBox(height: 20),
              SitePhoto(
                photoUrls: const [
                  'https://cdn2.thecatapi.com/images/2vr.jpg',
                  'https://cdn2.thecatapi.com/images/4gm.gif',
                  'https://cdn2.thecatapi.com/images/6lh.jpg',
                  'https://cdn2.thecatapi.com/images/73d.jpg',
                  'https://cdn2.thecatapi.com/images/cbj.jpg'
                ],
                title: 'Consent Form',
                onTap: () {
                  log('Tapped on Site Photo');
                },
              ),
              const SizedBox(height: 20),
              SitePhoto(
                photoUrls: const [
                  'https://cdn2.thecatapi.com/images/2vr.jpg',
                  'https://cdn2.thecatapi.com/images/4gm.gif',
                  'https://cdn2.thecatapi.com/images/6lh.jpg',
                  'https://cdn2.thecatapi.com/images/73d.jpg',
                  'https://cdn2.thecatapi.com/images/cbj.jpg'
                ],
                title: 'Declaration Form',
                onTap: () {
                  log('Tapped on Declaration Form');
                },
              ),
              const SizedBox(height: 20),
              SitePhoto(
                photoUrls: const [
                  'https://cdn2.thecatapi.com/images/2vr.jpg',
                  'https://cdn2.thecatapi.com/images/4gm.gif',
                  'https://cdn2.thecatapi.com/images/6lh.jpg',
                  'https://cdn2.thecatapi.com/images/73d.jpg',
                  'https://cdn2.thecatapi.com/images/cbj.jpg'
                ],
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

  final SiteSurveyController siteSurveyController =
      Get.find<SiteSurveyController>();

  TextEditingController latitudeController = TextEditingController(
    text: locationController.latitude.toString(),
  );
  TextEditingController longitudeController = TextEditingController(
    text: locationController.longitude.toString(),
  );

  return DetailsContainer(
    title: 'Location Details - ',
    subtitle: 'Hariyana',
    children: [
      Divider(
        color: Theme.of(context).colorScheme.primary,
        thickness: 1,
      ),
      const SizedBox(height: 10),
      CustomDropdown<Datum>(
        selectedValue: siteSurveyController.selectedDistrict,
        items: siteSurveyController.districtList,
        itemLabel: (datum) => datum.districtName ?? 'Unknown',
        label: 'Select District',
        onChanged: (Datum? newValue) {
          if (newValue != null) {
            siteSurveyController.selectedDistrict.value = newValue;
            siteSurveyController.clearDependentDropdowns();
            siteSurveyController.getTehsil(newValue.districtCode ?? '');
            siteSurveyController.getBlock(newValue.districtCode ?? '');
            log('Selected district: ${newValue.districtName}');
          } else {
            siteSurveyController.clearDependentDropdowns();
            log('No district selected');
          }
        },
      ),
      const SizedBox(height: 20),
      CustomDropdown<Tehsil>(
        label: 'Select Tehsil',
        selectedValue: siteSurveyController.selectedTehsil,
        items: siteSurveyController.tehsilList,
        itemLabel: (tehsil) => tehsil.tehsilName ?? 'Unknown',
        onChanged: (Tehsil? newValue) {
          if (newValue != null) {
            siteSurveyController.selectedTehsil.value = newValue;
            siteSurveyController.clearBlockAndVillage();
            siteSurveyController.getBlock(
                siteSurveyController.selectedDistrict.value?.districtCode ??
                    '');
            log('Selected tehsil: ${newValue.tehsilName}');
          } else {
            siteSurveyController.clearBlockAndVillage();
            log('No tehsil selected');
          }
        },
      ),
      const SizedBox(height: 20),
      CustomDropdown<Block>(
        label: 'Select Block',
        selectedValue: siteSurveyController.selectedBlock,
        items: siteSurveyController.blockList,
        itemLabel: (block) => block.blockName ?? 'Unknown',
        onChanged: (Block? newValue) {
          if (newValue != null) {
            siteSurveyController.selectedBlock.value = newValue;
            siteSurveyController.clearVillages();
            siteSurveyController.getVillage(
              siteSurveyController.selectedDistrict.value?.districtCode ?? '',
              siteSurveyController.selectedTehsil.value?.tehsilCode ?? '',
            );
            log('Selected block: ${newValue.blockName}');
          } else {
            siteSurveyController.clearVillages();
            log('No block selected');
          }
        },
      ),
      const SizedBox(height: 20),
      CustomDropdown<Village>(
        label: 'Select Village',
        selectedValue: siteSurveyController.selectedVillage,
        items: siteSurveyController.villageList,
        itemLabel: (village) => village.villageName ?? 'Unknown',
        onChanged: (Village? newValue) {
          if (newValue != null) {
            siteSurveyController.selectedVillage.value = newValue;
            log('Selected village: ${newValue.villageName}');
          } else {
            siteSurveyController.clearVillages();
            log('No village selected');
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
      const MyTextForm(
          keyboardType: TextInputType.number,
          labelText: 'Land Coverage Area (Sq.Meter)'),
      const MyTextForm(
          keyboardType: TextInputType.number,
          labelText: 'Water Depth Level (ft.)'),
    ],
  );
}

Widget _pumpDetails(BuildContext context) {
  final SiteSurveyController siteSurveyController =
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
      CustomDropdown(
        label: 'Pump Capacity (HP)',
        selectedValue: siteSurveyController.selectedPumpCapacity,
        items: siteSurveyController.pumpCapacity,
        itemLabel: (pump) => pump.toString(),
        onChanged: (newValue) {
          if (newValue != null) {
            siteSurveyController.selectedPumpCapacity.value =
                newValue; // Removed the extra dot
            log('Selected pump capacity: ${siteSurveyController.selectedPumpCapacity.value}');
          } else {
            // If needed, add a method to handle cases when no value is selected
            log('No pump capacity selected');
          }
        },
      ),
      const SizedBox(
        height: 20,
      ),
      CustomDropdown(
        label: 'Pump Type',
        selectedValue: siteSurveyController.selectedPumpType,
        items: siteSurveyController.pumpType,
        itemLabel: (pump) => pump.toString(),
        onChanged: (newValue) {
          if (newValue != null) {
            siteSurveyController.selectedPumpType.value =
                newValue; // Removed the extra dot
            log('Selected pump Type: ${siteSurveyController.selectedPumpType.value}');
          } else {
            log('No pump Type selected');
          }
        },
      ),
      const SizedBox(
        height: 20,
      ),
      CustomDropdown(
        label: 'Pump Sub Type',
        selectedValue: siteSurveyController.selectedPumpSubType,
        items: siteSurveyController.pumpSubType,
        itemLabel: (pump) => pump.toString(),
        onChanged: (newValue) {
          if (newValue != null) {
            siteSurveyController.selectedPumpSubType.value =
                newValue; // Removed the extra dot
            log('Selected pump SubType: ${siteSurveyController.selectedPumpSubType.value}');
          } else {
            log('No pump SubType selected');
          }
        },
      ),
      const SizedBox(
        height: 20,
      ),
      CustomDropdown(
        label: 'Pump Category',
        selectedValue: siteSurveyController.selectedPumpCategory,
        items: siteSurveyController.pumpCategory,
        itemLabel: (pump) => pump.toString(),
        onChanged: (newValue) {
          if (newValue != null) {
            siteSurveyController.selectedPumpCategory.value =
                newValue; // Removed the extra dot
            log('Selected pump Category: ${siteSurveyController.selectedPumpCategory.value}');
          } else {
            log('No pump Category selected');
          }
        },
      ),
      const SizedBox(
        height: 20,
      ),
      CustomDropdown(
        label: 'Controller Type',
        selectedValue: siteSurveyController.selectedControllerType,
        items: siteSurveyController.controllerType,
        itemLabel: (pump) => pump.toString(),
        onChanged: (newValue) {
          if (newValue != null) {
            siteSurveyController.selectedControllerType.value = newValue;
            log('Selected Controller Type: ${siteSurveyController.selectedControllerType.value}');
          } else {
            log('No Controller Type selected');
          }
        },
      ),
      const SizedBox(
        height: 10,
      ),
      const MyTextForm(
          keyboardType: TextInputType.number,
          labelText: 'Head of Pump (Meter)'),
      const MyTextForm(
          keyboardType: TextInputType.number,
          labelText: 'Depth of Pump to be installed (ft.)'),
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
      CustomDropdown(
        label: 'Irrigation Mode',
        selectedValue: siteSurveyController.selectedIrrigationMode,
        items: siteSurveyController.irrigationMode,
        itemLabel: (pump) => pump.toString(),
        onChanged: (newValue) {
          if (newValue != null) {
            siteSurveyController.selectedIrrigationMode.value = newValue;
            log('Selected Integration Mode: ${siteSurveyController.selectedIrrigationMode.value}');
          } else {
            log('No Integration Mode selected');
          }
        },
      ),
      const SizedBox(
        height: 20,
      ),
      CustomDropdown(
        label: 'Source of Water',
        selectedValue: siteSurveyController.selectedSourceOfWater,
        items: siteSurveyController.sourceOfWater,
        itemLabel: (pump) => pump.toString(),
        onChanged: (newValue) {
          if (newValue != null) {
            siteSurveyController.selectedSourceOfWater.value = newValue;
            log('Selected Source of Water: ${siteSurveyController.selectedSourceOfWater.value}');
          } else {
            log('No Source of Water selected');
          }
        },
      ),
      const SizedBox(
        height: 10,
      ),
      const MyTextForm(
          keyboardType: TextInputType.number,
          labelText: 'Size of BoreWell (ft.)'),
      const SizedBox(
        height: 10,
      ),
      CustomDropdown(
        label: 'Source of Power',
        selectedValue: siteSurveyController.selectedSourceOfPower,
        items: siteSurveyController.sourceOfPower,
        itemLabel: (pump) => pump.toString(),
        onChanged: (newValue) {
          if (newValue != null) {
            siteSurveyController.selectedSourceOfPower.value = newValue;
            log('Selected Source of Power: ${siteSurveyController.selectedSourceOfPower.value}');
          } else {
            log('No Source of Power selected');
          }
        },
      ),
      const SizedBox(
        height: 20,
      ),
      CustomDropdown(
        label: 'Having Electric Connection at Site?',
        selectedValue: siteSurveyController.selectedHaveElectricConnection,
        items: siteSurveyController.haveElectricConnection,
        itemLabel: (pump) => pump.toString(),
        onChanged: (newValue) {
          if (newValue != null) {
            siteSurveyController.selectedHaveElectricConnection.value =
                newValue;
            log('Selected Electric Connection: ${siteSurveyController.selectedHaveElectricConnection.value}');
          } else {
            log('No Electric Connection selected');
          }
        },
      ),
      const SizedBox(
        height: 20,
      ),
      CustomDropdown(
        label: 'Is South Facing Shadow Free Land Available?',
        selectedValue: siteSurveyController.selectedIsSouthFacingShadow,
        items: siteSurveyController.isSouthFacingShadow,
        itemLabel: (pump) => pump.toString(),
        onChanged: (newValue) {
          if (newValue != null) {
            siteSurveyController.selectedIsSouthFacingShadow.value = newValue;
            log('Selected South Facing Shadow: ${siteSurveyController.selectedIsSouthFacingShadow.value}');
          } else {
            log('No South Facing Shadow selected');
          }
        },
      ),
      const SizedBox(
        height: 20,
      ),
      CustomDropdown(
        label: 'Is Site Suitable for Pump Installation?',
        selectedValue: siteSurveyController.selectedIsSiteSuitableForPump,
        items: siteSurveyController.isSiteSuitableForPump,
        itemLabel: (pump) => pump.toString(),
        onChanged: (newValue) {
          if (newValue != null) {
            siteSurveyController.selectedIsSiteSuitableForPump.value = newValue;
            log('Selected Suitable For Pump: ${siteSurveyController.selectedIsSiteSuitableForPump.value}');
          } else {
            log('No Suitable For Pump selected');
          }
        },
      ),
      const SizedBox(
        height: 10,
      ),
      const MyTextForm(labelText: 'Remark'),
    ],
  );
}

class DetailsContainer extends StatelessWidget {
  final String title;
  final String? subtitle;
  final List<Widget> children;

  const DetailsContainer({
    required this.title,
    this.subtitle,
    required this.children,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
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
              const SizedBox(width: 8.0),
              Text(
                title,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(width: 8.0),
              Flexible(
                child: Text(
                  subtitle ?? '',
                  style: Theme.of(context).textTheme.titleLarge,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
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
