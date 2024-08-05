import 'dart:developer';

import 'package:flutter/material.dart';

import '../widgets/appbar_widget.dart';
import '../widgets/basic_details_widget.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_pump_widget.dart';
import '../widgets/site_photo_widget.dart';

class DispatchPage extends StatelessWidget {
  const DispatchPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> pumpList = [
      'Pump',
      'Motor',
      'Controller',
      'Solar Panel',
      'HDPE Pipe',
      'AC Cable',
      'DC Wire',
      'Hose Clamp',
      'Reducers',
      'BP Bend',
    ];

    return Scaffold(
      appBar: const AppbarWidget(
        title: 'Dispatch',
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BasicDetailsWidget(
            
            ),
            const SizedBox(height: 15),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: pumpList.length,
              itemBuilder: (context, index) {
                String pump = pumpList[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: CustomPump(text: pump),
                );
              },
            ),
            const SizedBox(height: 15),
            SitePhoto(
              title: 'Upload Material Dispatched Receipt',
              onTap: () {
                log('Tapped on Site Photo');
              },
            ),
            const SizedBox(height: 20),
            CustomButton(
              onPressed: () {
                log('Tapped on Submit');
              },
            ),
          ],
        ),
      ),
    );
  }
}
