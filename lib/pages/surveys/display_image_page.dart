import 'dart:io';

import 'package:flutter/material.dart';
import 'package:oswal/pages/widgets/appbar_widget.dart';

class DisplayCapturedImage extends StatelessWidget {
  final String imagePath;

  const DisplayCapturedImage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarWidget(title: 'Captured Image'),
      body: Center(
        child: imagePath.isNotEmpty
            ? Image.file(File(imagePath))
            : const Text('No image captured'),
      ),
    );
  }
}
