import 'package:flutter/material.dart';

class ButtonCircularWidget extends StatelessWidget {
  const ButtonCircularWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 24,
      height: 24,
      child: CircularProgressIndicator(
        color: Colors.white,
      ),
    );
  }
}
