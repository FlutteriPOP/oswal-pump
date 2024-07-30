import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oswal/controller/search_controller.dart';

import '../../theme/color.dart';
import '../widgets/appbar_widget.dart';
import 'custom_container_widget.dart';
import 'solar_id_page.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final SearchBarController searchBarController = Get.find();
    return Scaffold(
      appBar: const AppbarWidget(title: 'Search'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              const SizedBox(height: 20),
              _textForm(context, 'Search Farmer : Mobile, App No',
                  searchBarController),
              const SizedBox(height: 20),
              Obx(() {
                if (searchBarController.searchText.isNotEmpty) {
                  return const SolarIdPage();
                }
                return const CustomContainer();
              }),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _textForm(BuildContext context, String hintText,
      SearchBarController searchBarController) {
    final color = Theme.of(context).colorScheme.onSurface;

    return TextFormField(
      cursorColor: color,
      onChanged: (value) {
        searchBarController.updateSearchText(value);
      },
      style: TextStyle(color: color),
      decoration: _inputDecoration(context, hintText, color),
    );
  }

  InputDecoration _inputDecoration(
      BuildContext context, String hintText, Color color) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(color: color),
      border: _outlineInputBorder(color),
      enabledBorder: _outlineInputBorder(color),
      focusedBorder: _outlineInputBorder(color),
      suffixIcon: _searchIcon(context, color),
    );
  }

  OutlineInputBorder _outlineInputBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(50),
      borderSide: BorderSide(color: color, width: 2),
    );
  }

  Widget _searchIcon(BuildContext context, Color color) {
    return SizedBox(
      height: 55,
      width: 65,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: color,
        ),
        child: const Icon(
          Icons.search,
          color: primaryColorLight,
          size: 30,
        ),
      ),
    );
  }
}
