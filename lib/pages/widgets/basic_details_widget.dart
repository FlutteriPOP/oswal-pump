import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/search_controller.dart';

class BasicDetailsWidget extends StatelessWidget {
  final bool? isShow;

  const BasicDetailsWidget({
    super.key,
    this.isShow = false,
  });

  @override
  Widget build(BuildContext context) {
    final SearchBarController searchController = Get.put(SearchBarController());
    return Obx(() {
      final farmerDetail = searchController.searchResults.value;

      return Container(
        padding: const EdgeInsets.all(15),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isShow!) _basicDetails(context),
            _itemRow(
              context,
              icon: Icons.description_rounded,
              text: farmerDetail?.applicationNo ?? 'N/A',
            ),
            _itemRow(
              context,
              icon: Icons.person_2_rounded,
              text: farmerDetail?.farmerName ?? 'N/A',
            ),
            _itemRow(
              context,
              icon: Icons.phone_android_outlined,
              text: farmerDetail?.mobile ?? 'N/A',
            ),
            _itemRow(
              context,
              icon: Icons.extension_sharp,
              text:
                  '${farmerDetail?.sanctionName ?? 'N/A'} (${farmerDetail?.sanctionYear ?? 'N/A'})',
            ),
          ],
        ),
      );
    });
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

  Widget _basicDetails(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error, color: Theme.of(context).colorScheme.primary),
            const SizedBox(width: 10),
            Text(
              'Basic Details',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ],
        ),
        Divider(
          color: Theme.of(context).colorScheme.primary,
          thickness: 1,
        ),
      ],
    );
  }
}
