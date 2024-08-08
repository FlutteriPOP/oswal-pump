import 'package:flutter/material.dart';

class CustomPump extends StatelessWidget {
  final bool isDispatch;
  final String text;
  final VoidCallback onTap;
  final Color borderColor;

  const CustomPump({
    required this.text,
    required this.onTap,
    required this.borderColor,
    this.isDispatch = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: borderColor,
              width: 2,
            ),
            left: BorderSide(
              color: borderColor,
              width: 10,
            ),
            right: BorderSide(
              color: borderColor,
              width: 2,
            ),
            top: BorderSide(
              color: borderColor,
              width: 2,
            ),
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              if (!isDispatch)
                Icon(
                  Icons.check_circle_rounded,
                  color: Theme.of(context).colorScheme.primary,
                )
            ],
          ),
        ),
      ),
    );
  }
}
