import 'package:flutter/material.dart';
import 'package:oswal/theme/color.dart';

class MyCircularProgressWidget extends StatelessWidget {
  final double size;
  final Color progressColor;
  final String assetImagePath;
  final String loadingMessage;

  const MyCircularProgressWidget({
    super.key,
    this.size = 100.0,
    this.progressColor = primaryColor,
    this.assetImagePath = 'assets/images/icon.png',
    this.loadingMessage = 'Please Wait...',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Center(
              child: SizedBox(
                width: size + 2,
                height: size + 2,
                child: CircularProgressIndicator(
                  strokeWidth: 4.0,
                  backgroundColor: Colors.grey.withOpacity(0.2),
                  valueColor: AlwaysStoppedAnimation<Color>(progressColor),
                ),
              ),
            ),
            ClipOval(
              child: Image.asset(
                assetImagePath,
                width: size,
                height: size,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Text(
          loadingMessage,
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
