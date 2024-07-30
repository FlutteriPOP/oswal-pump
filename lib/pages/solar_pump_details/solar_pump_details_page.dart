import 'package:flutter/material.dart';
import 'package:oswal/pages/widgets/appbar_widget.dart';
import 'package:oswal/theme/color.dart';

class SolarDetailPage extends StatelessWidget {
  const SolarDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarWidget(
        title: 'Solar Details',
      ),
      body: ListView(
        padding: const EdgeInsets.all(10.0),
        children: const [
          ExpandableSection(
            title: 'Pump',
            available: '8',
            spare: '0',
            children: [
              SubSection(
                title: '7.5 HP DC Submersible',
                available: '4',
                spare: '0',
                items: [
                  [
                    '5123091002 dchiodn',
                    'OSSL-6750-30-DC',
                    'Available',
                    'Supplier A',
                    'Brand X',
                    'Location 1'
                  ],
                  [
                    '5123091005',
                    'OSSL-6750-30-DC',
                    'Available',
                    'Supplier B',
                    'Brand Y',
                    'Location 2'
                  ],
                  [
                    '5123091003',
                    'OSSL-6750-30-DC',
                    'Available',
                    'Supplier C',
                    'Brand Z',
                    'Location 3'
                  ],
                  [
                    '5123091004',
                    'OSSL-6750-30-DC',
                    'Available',
                    'Supplier D',
                    'Brand X',
                    'Location 4'
                  ],
                ],
              ),
              SubSection(
                title: '10 HP AC Submersible',
                available: '4',
                spare: '0',
                items: [
                  [
                    '5123091823',
                    'OSSL-9000-100-AC',
                    'Available',
                    'Supplier E',
                    'Brand W',
                    'Location 5'
                  ],
                  [
                    '5123091824',
                    'OSSL-9000-100-AC',
                    'Available',
                    'Supplier F',
                    'Brand V',
                    'Location 6'
                  ],
                  [
                    '5123091825',
                    'OSSL-9000-100-AC',
                    'Available',
                    'Supplier G',
                    'Brand U',
                    'Location 7'
                  ],
                  [
                    '5123091822',
                    'OSSL-9000-100-AC',
                    'Available',
                    'Supplier H',
                    'Brand T',
                    'Location 8'
                  ],
                ],
              ),
            ],
          ),
          ExpandableSection(
            title: 'Motor',
            available: '4',
            spare: '0',
            children: [
              SubSection(
                title: '7.5 HP DC Submersible',
                available: '4',
                spare: '0',
                items: [
                  [
                    '5123091002 dchiodn',
                    'OSSL-6750-30-DC',
                    'Available',
                    'Supplier A',
                    'Brand X',
                    'Location 1'
                  ],
                  [
                    '5123091005',
                    'OSSL-6750-30-DC',
                    'Available',
                    'Supplier B',
                    'Brand Y',
                    'Location 2'
                  ],
                  [
                    '5123091003',
                    'OSSL-6750-30-DC',
                    'Available',
                    'Supplier C',
                    'Brand Z',
                    'Location 3'
                  ],
                  [
                    '5123091004',
                    'OSSL-6750-30-DC',
                    'Available',
                    'Supplier D',
                    'Brand X',
                    'Location 4'
                  ],
                ],
              ),
              SubSection(
                title: '10 HP AC Submersible',
                available: '4',
                spare: '0',
                items: [
                  [
                    '5123091823',
                    'OSSL-9000-100-AC',
                    'Available',
                    'Supplier E',
                    'Brand W',
                    'Location 5'
                  ],
                  [
                    '5123091824',
                    'OSSL-9000-100-AC',
                    'Available',
                    'Supplier F',
                    'Brand V',
                    'Location 6'
                  ],
                  [
                    '5123091825',
                    'OSSL-9000-100-AC',
                    'Available',
                    'Supplier G',
                    'Brand U',
                    'Location 7'
                  ],
                  [
                    '5123091822',
                    'OSSL-9000-100-AC',
                    'Available',
                    'Supplier H',
                    'Brand T',
                    'Location 8'
                  ],
                ],
              ),
            ],
          ),
          ExpandableSection(
            title: 'Solar Panel',
            available: '2',
            spare: '0',
            children: [
              SubSection(
                title: '7.5 HP DC Submersible',
                available: '4',
                spare: '0',
                items: [
                  [
                    '5123091002 dchiodn',
                    'OSSL-6750-30-DC',
                    'Available',
                    'Supplier A',
                    'Brand X',
                    'Location 1'
                  ],
                  [
                    '5123091005',
                    'OSSL-6750-30-DC',
                    'Available',
                    'Supplier B',
                    'Brand Y',
                    'Location 2'
                  ],
                  [
                    '5123091003',
                    'OSSL-6750-30-DC',
                    'Available',
                    'Supplier C',
                    'Brand Z',
                    'Location 3'
                  ],
                  [
                    '5123091004',
                    'OSSL-6750-30-DC',
                    'Available',
                    'Supplier D',
                    'Brand X',
                    'Location 4'
                  ],
                ],
              ),
              SubSection(
                title: '10 HP AC Submersible',
                available: '4',
                spare: '0',
                items: [
                  [
                    '5123091823',
                    'OSSL-9000-100-AC',
                    'Available',
                    'Supplier E',
                    'Brand W',
                    'Location 5'
                  ],
                  [
                    '5123091824',
                    'OSSL-9000-100-AC',
                    'Available',
                    'Supplier F',
                    'Brand V',
                    'Location 6'
                  ],
                  [
                    '5123091825',
                    'OSSL-9000-100-AC',
                    'Available',
                    'Supplier G',
                    'Brand U',
                    'Location 7'
                  ],
                  [
                    '5123091822',
                    'OSSL-9000-100-AC',
                    'Available',
                    'Supplier H',
                    'Brand T',
                    'Location 8'
                  ],
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ExpandableSection extends StatefulWidget {
  final String title;
  final String available;
  final String spare;
  final List<Widget> children;

  const ExpandableSection({
    super.key,
    required this.title,
    required this.available,
    required this.spare,
    required this.children,
  });

  @override
  ExpandableSectionState createState() => ExpandableSectionState();
}

class ExpandableSectionState extends State<ExpandableSection> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
            color: Theme.of(context).colorScheme.surface, width: 1.5),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: _header(context),
          ),
          if (_isExpanded) ...widget.children,
        ],
      ),
    );
  }

  Widget _header(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        border: Border.all(
          color: Theme.of(context)
              .colorScheme
              .onSurface, // Replace with your desired color
          width: 2, // Adjust the width as needed
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.title,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontWeight: FontWeight.bold,
                ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _buildInfoRow(context, 'Available:', widget.available),
              const SizedBox(height: 4),
              _buildInfoRow(context, 'Spare:', widget.spare),
            ],
          ),
          Icon(
            _isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
            color: Theme.of(context).colorScheme.onSurface,
            size: 30,
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(BuildContext context, String label, String value) {
    return Row(
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
        ),
        const SizedBox(width: 4),
        Text(
          value,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }
}

class SubSection extends StatelessWidget {
  final String title;
  final String available;
  final String spare;
  final List<List<String>> items;

  const SubSection({
    super.key,
    required this.title,
    required this.available,
    required this.spare,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(
            color: Theme.of(context).colorScheme.primary, width: 1.5),
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          ListTile(
            title: Text(title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: primaryColorDark, fontWeight: FontWeight.bold)),
            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Available: $available',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: primaryColorDark),
                ),
                Text(
                  'Spare: $spare',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: primaryColorDark),
                ),
              ],
            ),
          ),
          _showTable(context, items),
        ],
      ),
    );
  }
}

Widget _showTable(BuildContext context, List<List<String>> items) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Table(
      border: TableBorder.all(color: Colors.grey.shade300),
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
            color: Theme.of(context).colorScheme.onSurface,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
          ),
          children: [
            'Serial Number',
            'Model Name',
            'Current Status',
            'Supplier Name',
            'Brand Name',
            'Location'
          ]
              .map((e) => Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      e,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ))
              .toList(),
        ),
        ...items.map(
          (item) => TableRow(
            children: item
                .map((e) => Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(e),
                    ))
                .toList(),
          ),
        ),
      ],
    ),
  );
}
