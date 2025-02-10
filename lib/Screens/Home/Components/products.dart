import 'package:flutter/material.dart';

class ProductRange extends StatelessWidget {
  const ProductRange({super.key});

  final List<Map<String, String>> products = const [
    {'name': 'ISP Series', 'image': 'assets/images/isp_series.png'},
    {'name': 'ISL Series', 'image': 'assets/images/isl_series.png'},
    {'name': 'ISF Series', 'image': 'assets/images/isl_series.png'},
    {'name': 'ISH Series', 'image': 'assets/images/isl_series.png'},
    {'name': 'IDP Series', 'image': 'assets/images/isl_series.png'},
    {'name': 'Hand Pumps', 'image': 'assets/images/hand_pump1.png'},
    {'name': 'Hand Pumps', 'image': 'assets/images/hand_pump2.png'},
    {'name': 'Power Pack Unit', 'image': 'assets/images/isl_series.png'},
    {'name': 'Hydraulic Tools', 'image': 'assets/images/isl_series.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Products Range',
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
              childAspectRatio: 0.8,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(12)),
                        child: Image.asset(
                          product['image']!,
                          fit: BoxFit.contain,
                          width: double.infinity,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        product['name']!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          const SizedBox(height: 16),
          Center(
            child: ElevatedButton.icon(
              onPressed: () {
                // Implement PDF download functionality here
              },
              icon: Icon(Icons.picture_as_pdf),
              label: Text("Download Catalogue"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
