import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Ensure you have GetX package added
import 'package:oswal/utils/routs.dart'; // Import your routes

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Navigate to the next screen after a delay
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 3), () {
        Get.offNamed(
            AppRouts.login); // Navigate to login page or any other page
      });
    });

    return Scaffold(
      backgroundColor:
          Colors.white, // Set background color to white or your preferred color
      body: Center(
        child: TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 0.0, end: 1.0),
          duration: const Duration(seconds: 3),
          builder: (context, opacity, child) {
            return Opacity(
              opacity: opacity,
              child: child,
            );
          },
          child: Image.asset(
            'assets/images/icon.png',
            height: 150,
            width: 150,
          ),
        ),
      ),
    );
  }
}
