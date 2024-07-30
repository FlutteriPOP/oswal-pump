import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oswal/theme/color.dart';

class CustomDropdown extends StatelessWidget {
  final RxString selectedValue;
  final List<String> items;
  final String label;
  final void Function(String?) onChanged;

  const CustomDropdown({
    super.key,
    required this.selectedValue,
    required this.items,
    required this.onChanged,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    // Ensure unique items and check if selected value exists
    final uniqueItems = items.toSet().toList();

    return Obx(() {
      return DropdownButtonFormField<String>(
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
        items: uniqueItems.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    item,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: primaryColor,
                        ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
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
      );
    });
  }
}
