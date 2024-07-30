import 'package:flutter/material.dart';

class BasicDetailsWidget extends StatelessWidget {
  final String pumpNumber;
  final String personName;
  final String phoneNumber;
  final String address;

  final String description;

  const BasicDetailsWidget({
    super.key,
    required this.pumpNumber,
    required this.personName,
    required this.phoneNumber,
    required this.address,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 0), // Shadow from all sides
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _itemRow(context, icon: Icons.description_rounded, text: pumpNumber),
          _itemRow(context, icon: Icons.person_2_rounded, text: personName),
          _itemRow(context,
              icon: Icons.phone_android_outlined, text: phoneNumber),
          _itemRow(context, icon: Icons.location_on, text: address),
          _itemRow(context, icon: Icons.extension_rounded, text: description),
        ],
      ),
    );
  }

  Widget _itemRow(BuildContext context,
      {required IconData icon, required String text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(icon, color: Theme.of(context).colorScheme.primary, size: 25),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    overflow: TextOverflow.ellipsis,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
