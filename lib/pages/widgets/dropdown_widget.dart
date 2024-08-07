import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDropdown<T> extends StatelessWidget {
  final Rx<T?> selectedValue;
  final List<T> items;
  final String label;
  final String Function(T) itemLabel;
  final void Function(T?) onChanged;

  const CustomDropdown({
    super.key,
    required this.selectedValue,
    required this.items,
    required this.itemLabel,
    required this.onChanged,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    // Remove duplicates while preserving order
    final uniqueItems = items.toSet().toList();

    return Obx(() {
      return DropdownButtonHideUnderline(
        child: DropdownButtonFormField<T>(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(
                color: Colors.blueGrey.shade300,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            labelText: label,
            labelStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
          value: uniqueItems.contains(selectedValue.value)
              ? selectedValue.value
              : null,
          hint: Text(
            label,
            style: const TextStyle(color: Colors.grey),
          ),
          items: uniqueItems.map((T item) {
            return DropdownMenuItem<T>(
              value: item,
              child: Container(
                constraints: const BoxConstraints(
                  maxWidth: 200, // Set max width for dropdown items
                ),
                child: Text(
                  itemLabel(item),
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
            );
          }).toList(),
          onChanged: (value) {
            if (value != null) {
              onChanged(value);
            }
          },
          isExpanded: true,
          dropdownColor: Theme.of(context).colorScheme.surface,
        ),
      );
    });
  }
}
