import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oswal/pages/widgets/appbar_widget.dart';
import 'package:oswal/pages/widgets/basic_details_widget.dart';
import 'package:oswal/pages/widgets/custom_button.dart';

import '../../controller/ic_photo_controller.dart';
import '../widgets/site_photo_widget.dart';

class IcPhotosPage extends StatelessWidget {
  const IcPhotosPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<IcPhotoController>();

    return Scaffold(
      appBar: const AppbarWidget(
        title: 'I&C Photos',
      ),
      bottomNavigationBar: Obx(
        () {
          return controller.isCompleted.value
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomButton(
                    onPressed: () {
                      log('Submitted');
                    },
                  ),
                )
              : const SizedBox.shrink();
        },
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            const BasicDetailsWidget(),
            const SizedBox(height: 20),
            _customQuestion(context, 'Is Installation Completed?'),
            const SizedBox(height: 10),
            Obx(() {
              // Only show the date picker if isCompleted is true
              return controller.isCompleted.value
                  ? _datePicker(context)
                  : const SizedBox.shrink();
            }),
            const SizedBox(height: 20),
            SitePhoto(
              icon: Icons.camera_alt_rounded,
              title: 'Foundation Picture',
              subtitle:
                  '(Gaddha Depth, Length-Width,\n RCC Filling, Pole Photo With Customer)',
              onTap: () {},
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
              icon: Icons.camera_alt_rounded,
              title: 'Mounting Structure Picture',
              subtitle: '(Assembled Installed Structure Photo Without Panels)',
              onTap: () {},
            ),
            const SizedBox(height: 20),
            SitePhoto(
              icon: Icons.camera_alt_rounded,
              title: 'Installed System with Farmer',
              subtitle:
                  '(Panel Installation With Customer,\n Water Discharge Photo With Customer)',
              onTap: () {},
            ),
            const SizedBox(height: 20),
            SitePhoto(
              icon: Icons.camera_alt_rounded,
              title: 'Controller Picture With Farmer',
              subtitle:
                  '(Installed Controller Photo With Customer LMM Bar Pic)',
              onTap: () {},
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

Widget _customQuestion(BuildContext context, String question) {
  final icPhotoController = Get.find<IcPhotoController>();

  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.surface,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 5,
          offset: const Offset(0, 0),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          question,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        Divider(
          color: Theme.of(context).colorScheme.primary,
          thickness: 1,
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Radio<String>(
                  value: 'yes',
                  groupValue: icPhotoController.selectedValue.value,
                  onChanged: (value) {
                    if (value != null) {
                      icPhotoController.toggleCompleted(value);
                    }
                  },
                )),
            Text(
              'Yes',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(width: 20),
            Obx(() => Radio<String>(
                  value: 'no',
                  groupValue: icPhotoController.selectedValue.value,
                  onChanged: (value) {
                    if (value != null) {
                      icPhotoController.toggleCompleted(value);
                    }
                  },
                )),
            Text(
              'No',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _datePicker(BuildContext context) {
  final TextEditingController dateController = TextEditingController();

  Future<void> selectDate() async {
    // Show Date Picker
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (selectedDate != null) {
      // Show Time Picker
      final TimeOfDay? selectedTime = await showTimePicker(
        // ignore: use_build_context_synchronously
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (selectedTime != null) {
        // Combine selected date and time
        final DateTime combinedDateTime = DateTime(
          selectedDate.year,
          selectedDate.month,
          selectedDate.day,
          selectedTime.hour,
          selectedTime.minute,
        );

        // Format date and time as yyyy-MM-dd HH:mm
        final String formattedDateTime =
            "${combinedDateTime.toLocal()}".split('.')[0];
        dateController.text = formattedDateTime;
      }
    }
  }

  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.surface,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 5,
          offset: const Offset(0, 0),
        ),
      ],
    ),
    child: InkWell(
      onTap: selectDate, // Trigger date and time picker on tap
      child: AbsorbPointer(
        child: TextFormField(
          controller: dateController,
          readOnly: true,
          decoration: const InputDecoration(
            suffixIcon: Icon(Icons.date_range_rounded, color: Colors.red),
            labelText: 'Date and Time of Installation',
            border: OutlineInputBorder(),
          ),
        ),
      ),
    ),
  );
}
