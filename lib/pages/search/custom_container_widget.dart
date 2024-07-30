import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/color.dart';
import '../../utils/routs.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRouts.solarDetails);
      },
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: colorScheme.onSurface,
            width: 2,
          ),
        ),
        child: Column(
          children: [
            _buildHeader(context, colorScheme, textTheme),
            _buildDivider(colorScheme),
            const SizedBox(height: 5),
            _buildStockInfo(context, colorScheme, textTheme),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(
      BuildContext context, ColorScheme colorScheme, TextTheme textTheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.engineering,
          color: colorScheme.onSurface,
          size: 40,
        ),
        const SizedBox(width: 10),
        Text(
          'AMAN',
          style:
              textTheme.headlineLarge?.copyWith(color: colorScheme.onSurface),
        ),
      ],
    );
  }

  Widget _buildDivider(ColorScheme colorScheme) {
    return Divider(
      color: colorScheme.onSurface,
      thickness: 1,
      endIndent: 10,
      indent: 10,
    );
  }

  Widget _buildStockInfo(
      BuildContext context, ColorScheme colorScheme, TextTheme textTheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _stockColumn(
            context,
            'Available Stock',
            ['Pumps: 8', 'Motors: 4', 'Controllers: 0', 'Modules: 2'],
            colorScheme,
            textTheme),
        _verticalDivider(),
        _stockColumn(
            context,
            'Spare Stock',
            ['Pumps: 0', 'Motors: 0', 'Controllers: 0', 'Modules: 0'],
            colorScheme,
            textTheme),
      ],
    );
  }

  Widget _stockColumn(BuildContext context, String title, List<String> items,
      ColorScheme colorScheme, TextTheme textTheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: textTheme.titleLarge?.copyWith(color: colorScheme.onSurface),
        ),
        const SizedBox(height: 5),
        _rowDivider(),
        const SizedBox(height: 5),
        ...items.map((item) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.0),
              child: Text(
                item,
                style: textTheme.titleMedium
                    ?.copyWith(color: colorScheme.onSurface),
              ),
            )),
      ],
    );
  }

  Widget _verticalDivider() {
    return Container(
      height: 130,
      width: 2,
      color: Colors.grey,
    );
  }

  Widget _rowDivider() {
    return Container(
      height: 1,
      width: 130,
      color: primaryColorDark,
    );
  }
}
