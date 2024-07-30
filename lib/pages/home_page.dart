import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oswal/pages/widgets/appbar_widget.dart';
import 'package:oswal/pages/widgets/tost_widget.dart';
import 'package:oswal/utils/routs.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarWidget(title: 'Pumps', showLeading: false),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(
          children: [
            _customImage(
              context,
              isBlur: false,
              'assets/images/solar1.jpg',
              'Solar Pump',
            ),
            const SizedBox(height: 20),
            _customImage(
              context,
              'assets/images/solar2.jpg',
              'Solar Rooftop',
              isBlur: true,
            ),
            const SizedBox(height: 20),
            _customImage(
              context,
              'assets/images/solar3.jpg',
              'Solar Street Light',
              isBlur: true,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _customImage(
    BuildContext context,
    String imagePath,
    String pumpName, {
    bool isBlur = false,
  }) {
    const double imageHeight = 220.0;

    return GestureDetector(
      onTap: () {
        if (isBlur == true) {
          showToast('Coming Soon !');
        } else {
          Get.toNamed(AppRouts.search);
        }
      },
      child: Container(
        width: double.infinity,
        height: imageHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Theme.of(context).colorScheme.onSurface,
            width: 2.5,
          ),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.fill,
          ),
        ),
        child: Stack(
          children: [
            if (isBlur)
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey
                        .withOpacity(0.5), // Semi-transparent overlay
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            Positioned(
              bottom: 10,
              left: 10,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  pumpName,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
