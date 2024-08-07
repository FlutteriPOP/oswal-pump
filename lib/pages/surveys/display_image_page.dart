import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oswal/pages/widgets/appbar_widget.dart';
import 'package:oswal/pages/widgets/custom_button.dart';

import '../../controller/location_controller.dart';
import '../../controller/search_controller.dart';

class DisplayCapturedImage extends StatelessWidget {
  final String imagePath;

  const DisplayCapturedImage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    final SearchBarController searchBarController = Get.find();
    final LocationController locationController = Get.find();

    final DateTime now = DateTime.now();

    final data = searchBarController.searchResults.value;

    return Scaffold(
      appBar: const AppbarWidget(title: 'Captured Image'),
      body: imagePath.isNotEmpty
          ? Stack(
              fit: StackFit.expand,
              children: [
                _buildImage(context),
                _buildOverlay(
                    context, data, locationController, now.toString()),
              ],
            )
          : Center(
              child: Text(
                'No image captured',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: Colors.grey),
              ),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: CustomButton(
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error, color: Colors.white),
              const SizedBox(width: 8),
              Text(
                'Upload Image',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.white,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Image.file(
          File(imagePath),
          fit: BoxFit.cover,
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          errorBuilder: (context, error, stackTrace) {
            return Center(
              child: Text(
                'Failed to load image',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: Colors.red),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildOverlay(BuildContext context, dynamic data,
      LocationController locationController, String formattedDate) {
    return Positioned(
      bottom: 80,
      left: 10,
      right: 10,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTextRow(
              '${data?.applicationNo ?? 'N/A'} - ${data?.farmerName ?? 'N/A'}',
              context,
            ),
            _buildTextRow(
              'Latitude: ${locationController.latitude}, Longitude: ${locationController.longitude}',
              context,
            ),
            _buildTextRow(
              'Location Name: ${locationController.locationName}',
              context,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
            _buildTextRow(
              'Accuracy: ${locationController.accuracy}',
              context,
            ),
            _buildTextRow(
              'Date & Time: $formattedDate',
              context,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextRow(String text, BuildContext context,
      {TextOverflow overflow = TextOverflow.visible, int? maxLines}) {
    return Text(
      text,
      overflow: overflow,
      maxLines: maxLines,
      style:
          Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),
    );
  }
}
