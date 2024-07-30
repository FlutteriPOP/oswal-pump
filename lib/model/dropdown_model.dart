import 'package:get/get.dart';

class DropdownItem {
  final String label;
  final List<String> items;
  final RxString selectedItem;

  DropdownItem({
    required this.label,
    required this.items,
    required this.selectedItem,
  });
}