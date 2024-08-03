import 'dart:developer';

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
    final controller = TextEditingController();
    final searchBarController = Get.find<SearchBarController>();
    final theme = Theme.of(context);

    return Scaffold(
      appBar: const AppbarWidget(title: 'Search'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              const SizedBox(height: 20),
              TextFormField(
                cursorColor: theme.colorScheme.onSurface,
                controller: controller,
                // onChanged: (text) {
                //   searchBarController.updateSearchText(text);
                // },
                decoration: InputDecoration(
                  hintText: 'Search Farmer: Mobile, APP No',
                  hintStyle: TextStyle(color: theme.colorScheme.onSurface),
                  border: _outlineInputBorder(theme.colorScheme.onSurface),
                  enabledBorder:
                      _outlineInputBorder(theme.colorScheme.onSurface),
                  focusedBorder:
                      _outlineInputBorder(theme.colorScheme.onSurface),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      final searchText = controller.text;
                      if (searchText.isNotEmpty) {
                        log('Search text is not empty');
                        searchBarController.updateSearchText(searchText);
                      } else {
                        log('Search text is empty');
                        searchBarController.searchResults.value = null;
                      }
                    },
                    child: Container(
                      height: 55,
                      width: 65,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: theme.colorScheme.onSurface,
                      ),
                      child: const Icon(
                        Icons.search,
                        color: primaryColorLight,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Obx(() {
                if (searchBarController.isLoading.value) {
                  return const CircularProgressIndicator();
                } else if (searchBarController.searchResults.value != null) {
                  return SolarIdPage();
                } else {
                  return const CustomContainer();
                }
              }),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  OutlineInputBorder _outlineInputBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(50),
      borderSide: BorderSide(color: color, width: 2),
    );
  }
}
