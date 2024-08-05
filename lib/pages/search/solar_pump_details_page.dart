import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oswal/pages/widgets/appbar_widget.dart';
import 'package:oswal/theme/color.dart';

import '../../controller/godown_detail_controller.dart';
import '../widgets/my_circular_widget.dart';

class SolarDetailPage extends StatefulWidget {
  const SolarDetailPage({super.key});

  @override
  SolarDetailPageState createState() => SolarDetailPageState();
}

class SolarDetailPageState extends State<SolarDetailPage> {
  final GodownDetailController controller = Get.put(GodownDetailController());
  int? _expandedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarWidget(
        title: 'Solar Pump Details',
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(
              child: MyCircularProgressWidget(
            progressColor: Theme.of(context).primaryColor,
            loadingMessage: 'Loading...',
          ));
        }

        if (controller.errorMessage.isNotEmpty) {
          return Center(child: Text(controller.errorMessage.value));
        }

        if (controller.data.isEmpty ||
            controller.data[0].data == null ||
            controller.data[0].data!.isEmpty) {
          return Center(
              child: Text(
            'No data available',
            style: Theme.of(context).textTheme.headlineMedium,
          ));
        }

        return ListView.builder(
          itemCount: controller.data[0].data!.length,
          itemBuilder: (context, index) {
            final model = controller.data[0].data?[index];
            final specificationData = model?.modelSpecificationData;

            final isExpanded = _expandedIndex == index;

            return Column(
              children: [
                _modelCard(model, index, isExpanded),
                if (isExpanded)
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: specificationData?.length ?? 0,
                    itemBuilder: (context, specIndex) {
                      final spec = specificationData?[specIndex];
                      final serialDataList =
                          spec?.specificationSerialData ?? [];

                      return Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 8),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 2),
                            ),
                          ],
                          border: Border.all(color: Colors.green, width: 2),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(spec?.specificationName ?? 'N/A',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    _totalQuantity(
                                      'Available: ${spec?.totalQty ?? 'N/A'}',
                                      'Spare: ${spec?.spareQty ?? 'N/A'}',
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Table(
                                border: TableBorder.all(color: Colors.grey),
                                columnWidths: const {
                                  0: IntrinsicColumnWidth(),
                                  1: IntrinsicColumnWidth(),
                                  2: IntrinsicColumnWidth(),
                                  3: IntrinsicColumnWidth(),
                                  4: IntrinsicColumnWidth(),
                                  5: IntrinsicColumnWidth(),
                                },
                                children: [
                                  TableRow(
                                    decoration: BoxDecoration(
                                        color: Theme.of(context)
                                            .primaryColor
                                            .withOpacity(0.4)),
                                    children: [
                                      _tableCell('Serial Number',
                                          isHeader: true),
                                      _tableCell('Model Name', isHeader: true),
                                      _tableCell('Current Status',
                                          isHeader: true),
                                      _tableCell('Supplier Name',
                                          isHeader: true),
                                      _tableCell('Brand Name', isHeader: true),
                                      _tableCell('Location', isHeader: true),
                                    ],
                                  ),
                                  ...serialDataList
                                      .where((serialData) =>
                                          serialData.assetHistoryId != "")
                                      .map((serialData) {
                                    return TableRow(
                                      decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .primaryColor
                                              .withOpacity(0.1)),
                                      children: [
                                        _tableCell(
                                            serialData.serialNo?.isEmpty ?? true
                                                ? 'N/A'
                                                : serialData.serialNo!),
                                        _tableCell(serialData
                                                    .assetModelName?.isEmpty ??
                                                true
                                            ? 'N/A'
                                            : serialData.assetModelName!),
                                        _tableCell(
                                            serialData.status?.isEmpty ?? true
                                                ? 'N/A'
                                                : serialData.status!),
                                        _tableCell(
                                            serialData.supplierName?.isEmpty ??
                                                    true
                                                ? 'N/A'
                                                : serialData.supplierName!),
                                        _tableCell(
                                            serialData.brandName?.isEmpty ??
                                                    true
                                                ? 'N/A'
                                                : serialData.brandName!),
                                        _tableCell(
                                            serialData.assetLocation?.isEmpty ??
                                                    true
                                                ? 'N/A'
                                                : serialData.assetLocation!),
                                      ],
                                    );
                                  }),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
              ],
            );
          },
        );
      }),
    );
  }

  Widget _modelCard(model, int index, bool isExpanded) {
    return InkWell(
      onTap: () {
        setState(() {
          _expandedIndex = isExpanded ? null : index;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
          border: const Border(
            bottom: BorderSide(
              color: Colors.green,
              width: 2,
            ),
            left: BorderSide(
              color: Colors.green,
              width: 10,
            ),
            right: BorderSide(
              color: Colors.green,
              width: 2,
            ),
            top: BorderSide(
              color: Colors.green,
              width: 2,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    model?.assetName ?? 'N/A',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                const Spacer(),
                _totalQuantity(
                  'Available: ${model?.totalQty ?? 'N/A'}',
                  'Spare: ${model?.spareQty ?? 'N/A'}',
                ),
                const Spacer(),
                Icon(
                  isExpanded
                      ? Icons.arrow_drop_up_outlined
                      : Icons.arrow_drop_down_outlined,
                  color: Colors.green,
                  size: 38,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _totalQuantity(String available, String spare) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          available,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Text(
          spare,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }

  Widget _tableCell(String text, {bool isHeader = false}) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
          color: isHeader ? primaryColorDark : Colors.black87,
        ),
      ),
    );
  }
}
