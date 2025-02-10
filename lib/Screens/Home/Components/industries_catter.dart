import 'package:flutter/material.dart';

class IndustriesWeCater extends StatelessWidget {
  const IndustriesWeCater({super.key});

  final List<Map<String, dynamic>> industries = const [
    {'name': 'Construction & Infrastructure', 'icon': Icons.construction},
    {'name': 'Steel & Aluminium', 'icon': Icons.factory},
    {'name': 'Power', 'icon': Icons.electrical_services},
    {'name': 'Cement', 'icon': Icons.business},
    {'name': 'Paper', 'icon': Icons.description},
    {'name': 'Automobile', 'icon': Icons.directions_car},
    {'name': 'Mining', 'icon': Icons.iron},
    {'name': 'Railways', 'icon': Icons.train},
    {'name': 'Oil & Gas', 'icon': Icons.local_gas_station},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Industries We Cater',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
            ),
          ),
          const SizedBox(height: 12),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 3.5,
            ),
            itemCount: industries.length,
            itemBuilder: (context, index) {
              final industry = industries[index];
              return Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Icon(
                        industry['icon'],
                        size: 28,
                        color: Colors.blueAccent,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          industry['name'],
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
