import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool showLeading;

  const AppbarWidget({
    super.key,
    this.title,
    this.showLeading = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: showLeading
          ? GestureDetector(
              onTap: () {
                Get.back();
              },
              child: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
            )
          : null,
      centerTitle: true,
      backgroundColor: Theme.of(context).colorScheme.primary,
      title: Text(
        title ?? '',
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
