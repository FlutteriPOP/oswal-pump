import 'package:flutter/material.dart';

class ButtonCirculerWidget extends StatelessWidget {
  const ButtonCirculerWidget({super.key});

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
