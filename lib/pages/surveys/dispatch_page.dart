import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/dispatch_controller.dart';
import '../widgets/appbar_widget.dart';
import '../widgets/basic_details_widget.dart';
import '../widgets/custom_pump_widget.dart';
import '../widgets/my_circular_widget.dart';
import '../widgets/site_photo_widget.dart';

class DispatchPage extends StatelessWidget {
  const DispatchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final DispatchController dispatchController =
        Get.find<DispatchController>();

    return Scaffold(
      appBar: const AppbarWidget(
        title: 'Dispatch',
      ),
      body: Obx(
        () {
          if (dispatchController.isLoading.value) {
            return const MyCircularProgressWidget();
          }

          final dispatchData =
              dispatchController.dispatchData.value?.data[0].farmerAsset;

          if (dispatchData == null || dispatchData.isEmpty) {
            return const Center(
                child: Text('No dispatch data available.',
                    style: TextStyle(fontSize: 18)));
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BasicDetailsWidget(
                  isShowSubmersible: true,
                ),
                const SizedBox(height: 15),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: dispatchData.length,
                  itemBuilder: (context, index) {
                    final pumps = dispatchData[index];
                    final borderColor = dispatchController
                                .getDispatchStatus(pumps.assetId.toString()) ==
                            "1"
                        ? Theme.of(context).colorScheme.primary
                        : Colors.grey;

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: CustomPump(
                        isDispatch: dispatchController
                                .getDispatchStatus(pumps.assetId.toString()) ==
                            "0",
                        text: pumps.assetName ?? 'N/A',
                        borderColor: borderColor,
                        onTap: () {
                          dispatchController.setDispatch(
                            assetId: pumps.assetId.toString(),
                          );

                          log('Tapped on asset ID: ${pumps.assetId}');
                        },
                      ),
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
              ],
            ),
          );
        },
      ),
    );
  }
}
