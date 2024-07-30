import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oswal/controller/dropdown_controller.dart';
import 'package:oswal/pages/widgets/appbar_widget.dart';
import 'package:oswal/pages/widgets/basic_details_widget.dart';
import 'package:oswal/pages/widgets/custom_button.dart';
import 'package:oswal/pages/widgets/site_photo_widget.dart';
import 'package:oswal/utils/routs.dart';

import '../../theme/color.dart';
import '../widgets/dropdown_widget.dart';
import '../widgets/mtext_form.dart';

class SiteSurveyPage extends StatelessWidget {
  const SiteSurveyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarWidget(
        title: 'Site Survey',
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BasicDetailsWidget(
              pumpNumber: 'pumpNumber',
              personName: 'personName',
              phoneNumber: 'phoneNumber',
              address: 'address',
              description: 'description',
            ),
            const SizedBox(height: 30),
            _locationDetails(context),
            const SizedBox(height: 30),
            _pumpDetails(context),
            const SizedBox(height: 30),
            _otherDetails(context),
            const SizedBox(height: 30),
            SitePhoto(
              
              title: 'Site Photo',
              onTap: () {
                Get.toNamed(AppRouts.camera);
                log('Tapped on Site Photo');
              },
            ),
            const SizedBox(height: 30),
            SitePhoto(
              photoUrls: const [
                'https://picsum.photos/200',
                'https://picsum.photos/100',
                'https://picsum.photos/300',
                'https://picsum.photos/400',
                'https://picsum.photos/id/1/200'
              ],
              title: 'Consent Form',
              onTap: () {
                log('Tapped on Site Photo');
              },

            ),
            const SizedBox(height: 30),
            SitePhoto(
              title: 'Declaration Form',
              onTap: () {
                log('Tapped on Declaration Form');
              },
            ),
            const SizedBox(height: 30),
            SitePhoto(
              title: 'Land Paper Form',
              onTap: () {
                log('Tapped on Site Photo');
              },
            ),
            const SizedBox(height: 30),
            CustomButton(
              onPressed: () => log('Tapped on Submit'),
            
            ),
          ],
        ),
      ),
    );
  }
}

Widget _locationDetails(BuildContext context) {
  final DropdownController dropdownController = Get.find();
  return DetailsContainer(
    title: 'Location Details - Hariyana',
    children: [
      Divider(
        color: Theme.of(context).colorScheme.primary,
        thickness: 1,
      ),
      const SizedBox(
        height: 10,
      ),
      CustomDropdown(
        label: 'District',
        selectedValue: dropdownController.selectedDistrict,
        items: dropdownController.district,
        onChanged: (newValue) => dropdownController.selectedDistrict(newValue!),
      ),
      const SizedBox(
        height: 20,
      ),
      CustomDropdown(
        label: 'Tehsil',
        selectedValue: dropdownController.selectedTehsil,
        items: dropdownController.tehsil,
        onChanged: (newValue) => dropdownController.selectedTehsil(newValue!),
      ),
      const SizedBox(
        height: 20,
      ),
      CustomDropdown(
        label: 'Village',
        selectedValue: dropdownController.selectedVillage,
        items: dropdownController.village,
        onChanged: (newValue) => dropdownController.selectedVillage(newValue!),
      ),
      const SizedBox(
        height: 20,
      ),
      CustomDropdown(
        label: 'Block',
        selectedValue: dropdownController.selectedBlock,
        items: dropdownController.block,
        onChanged: (newValue) => dropdownController.selectedBlock(newValue!),
      ),
      const SizedBox(
        height: 10,
      ),
      MyTextForm(
          enabled: false,
          labelText: 'Latitude',
          suffixIcon: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.my_location_rounded,
              color: Theme.of(context).colorScheme.error,
            ),
          )),
      MyTextForm(
          enabled: false,
          labelText: 'Longitude',
          suffixIcon: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.my_location_rounded,
              color: Theme.of(context).colorScheme.error,
            ),
          )),
      const MyTextForm(labelText: 'Survey Number'),
      const MyTextForm(labelText: 'Killa Number'),
      const MyTextForm(labelText: 'Land Coverage Area (Sq.Meter)'),
      const MyTextForm(labelText: 'Water Depth Level (ft.)'),
    ],
  );
}

Widget _pumpDetails(BuildContext context) {
  final DropdownController dropdownController = Get.put(DropdownController());
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
        label: 'Pump Capacity (Hp)',
        selectedValue: dropdownController.selectedDistrict,
        items: dropdownController.district,
        onChanged: (newValue) => dropdownController.selectedDistrict(newValue!),
      ),
      const SizedBox(
        height: 20,
      ),
      CustomDropdown(
        label: 'Pump Type',
        selectedValue: dropdownController.selectedTehsil,
        items: dropdownController.tehsil,
        onChanged: (newValue) => dropdownController.selectedTehsil(newValue!),
      ),
      const SizedBox(
        height: 20,
      ),
      CustomDropdown(
        label: 'Pump Sub Type',
        selectedValue: dropdownController.selectedVillage,
        items: dropdownController.village,
        onChanged: (newValue) => dropdownController.selectedVillage(newValue!),
      ),
      const SizedBox(
        height: 20,
      ),
      CustomDropdown(
        label: 'Pump Category',
        selectedValue: dropdownController.selectedBlock,
        items: dropdownController.block,
        onChanged: (newValue) => dropdownController.selectedBlock(newValue!),
      ),
      const SizedBox(
        height: 20,
      ),
      CustomDropdown(
        label: 'Controller Type',
        selectedValue: dropdownController.selectedBlock,
        items: dropdownController.block,
        onChanged: (newValue) => dropdownController.selectedBlock(newValue!),
      ),
      const SizedBox(
        height: 10,
      ),
      const MyTextForm(labelText: 'Head of Pump (Meter)'),
      const MyTextForm(labelText: 'Depth of Pump to be installed (ft.)'),
    ],
  );
}

Widget _otherDetails(BuildContext context) {
  final DropdownController dropdownController = Get.put(DropdownController());
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
        selectedValue: dropdownController.selectedDistrict,
        items: dropdownController.district,
        onChanged: (newValue) => dropdownController.selectedDistrict(newValue!),
      ),
      const SizedBox(
        height: 20,
      ),
      CustomDropdown(
        label: 'Source of Water',
        selectedValue: dropdownController.selectedTehsil,
        items: dropdownController.tehsil,
        onChanged: (newValue) => dropdownController.selectedTehsil(newValue!),
      ),
      const SizedBox(
        height: 20,
      ),
      CustomDropdown(
        label: 'Size of BoreWell (ft.)',
        selectedValue: dropdownController.selectedVillage,
        items: dropdownController.village,
        onChanged: (newValue) => dropdownController.selectedVillage(newValue!),
      ),
      const SizedBox(
        height: 20,
      ),
      CustomDropdown(
        label: 'Source of Power',
        selectedValue: dropdownController.selectedBlock,
        items: dropdownController.block,
        onChanged: (newValue) => dropdownController.selectedBlock(newValue!),
      ),
      const SizedBox(
        height: 20,
      ),
      CustomDropdown(
        label: 'Having Electric Connection at Site?',
        selectedValue: dropdownController.selectedBlock,
        items: dropdownController.block,
        onChanged: (newValue) => dropdownController.selectedBlock(newValue!),
      ),
      const SizedBox(
        height: 20,
      ),
      CustomDropdown(
        label: 'Is South Facing Shadow Free Land Available?',
        selectedValue: dropdownController.selectedBlock,
        items: dropdownController.block,
        onChanged: (newValue) => dropdownController.selectedBlock(newValue!),
      ),
      const SizedBox(
        height: 20,
      ),
      CustomDropdown(
        label: 'Is Site Suitable for Pump Installation?',
        selectedValue: dropdownController.selectedBlock,
        items: dropdownController.block,
        onChanged: (newValue) => dropdownController.selectedBlock(newValue!),
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
