// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class ScannerWidget extends StatelessWidget {
//   final Color color;
//   final Color buttonColor;
//   final String text;
//   final VoidCallback onScanTap;
//   final VoidCallback onManualTap;

//   const ScannerWidget({
//     Key? key,
//     required this.color,
//     required this.buttonColor,
//     required this.text,
//     required this.onScanTap,
//     required this.onManualTap,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.find<AssetMappingController>();

//     return GestureDetector(
//       onTap: controller.toggleExpanded,
//       child: Container(
//         padding: const EdgeInsets.all(10.0),
//         decoration: BoxDecoration(
//           border: Border.all(color: color),
//           borderRadius: BorderRadius.circular(10),
//           color: Theme.of(context).colorScheme.surface,
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.2),
//               blurRadius: 8,
//               offset: const Offset(0, 0),
//             ),
//           ],
//         ),
//         child: Obx(
//           () => Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Spacer(),
//                   Text(
//                     text,
//                     style: Theme.of(context)
//                         .textTheme
//                         .headlineMedium
//                         ?.copyWith(color: color),
//                   ),
//                   const Spacer(),
//                   IconButton(
//                     icon: const Icon(Icons.edit, color: Colors.black, size: 30),
//                     onPressed: controller.toggleExpanded,
//                   ),
//                 ],
//               ),
//               if (controller.isExpanded.value)
//                 _scannerOptions(context, color, buttonColor, onScanTap, onManualTap),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _scannerOptions(
//     BuildContext context,
//     Color color,
//     Color buttonColor,
//     VoidCallback onScanTap,
//     VoidCallback onManualTap,
//   ) {
//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             _scannerOptionButton(
//               context,
//               color,
//               buttonColor,
//               onScanTap,
//               Icons.qr_code_scanner_sharp,
//               'Scan',
//             ),
//             const SizedBox(width: 10),
//             _scannerOptionButton(
//               context,
//               color,
//               buttonColor,
//               onManualTap,
//               Icons.keyboard,
//               'Manually',
//             ),
//           ],
//         ),
//         const SizedBox(height: 10),
//         Obx(
//           () {
//             if (controller.manualInput.value) {
//               return Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 10),
//                 child: TextFormField(
//                   decoration: InputDecoration(
//                     labelText: 'Enter details manually',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                   onFieldSubmitted: (input) async {
//                     await controller.handleManualInput(input);
//                   },
//                 ),
//               );
//             }
//             return const SizedBox.shrink();
//           },
//         ),
//       ],
//     );
//   }

//   Widget _scannerOptionButton(
//     BuildContext context,
//     Color color,
//     Color buttonColor,
//     VoidCallback onTap,
//     IconData icon,
//     String text,
//   ) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(30),
//           color: buttonColor,
//           border: Border.all(color: color, width: 2),
//         ),
//         child: Row(
//           children: [
//             Icon(icon, color: buttonColor),
//             const SizedBox(width: 10),
//             Text(
//               text,
//               style: Theme.of(context).textTheme.titleLarge?.copyWith(color: color),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }