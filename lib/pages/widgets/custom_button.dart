import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Widget? child; // Add child parameter
  final double width;
  final double height;
  final Color? backgroundColor;
  final Color? textColor;
  final BorderRadius? borderRadius;
  final BorderSide? border;
  final VoidCallback? onPressed;

  const CustomButton({
    super.key,
    this.child,
    this.width = double.infinity,
    this.height = 60,
    this.backgroundColor,
    this.textColor,
    this.borderRadius,
    this.border,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: borderRadius ?? BorderRadius.circular(50),
      child: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: backgroundColor ?? Theme.of(context).colorScheme.primary,
          borderRadius: borderRadius ?? BorderRadius.circular(50),
          border: Border.all(
            color: Theme.of(context).colorScheme.onSurface,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Center(child: child), // Center the child widget
      ),
    );
  }
}