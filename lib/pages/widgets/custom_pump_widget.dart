import 'package:flutter/material.dart';

class CustomPump extends StatelessWidget {
  final String text;

  const CustomPump({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(
                color: Theme.of(context).colorScheme.primary, width: 2),
            left: BorderSide(
                color: Theme.of(context).colorScheme.primary, width: 10),
            right: BorderSide(
                color: Theme.of(context).colorScheme.primary, width: 2),
            top: BorderSide(
                color: Theme.of(context).colorScheme.primary, width: 2)),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          text,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
