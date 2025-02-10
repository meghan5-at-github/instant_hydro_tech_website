import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:instant_hydrotech/Screens/Home/Components/products.dart';

import 'industries_catter.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool isLargeScreen = size.width > 600; // Check if it's a large screen

    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: isLargeScreen
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // ✅ Text Section (on Large Screens)
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Text(
                                "Instant Hydro Tech was established in the year 2024 and carved a niche as the leading manufacturer and trader of a wide range of Hydraulic jacks, cylinders, hand pumps, power pack units, workshop press, hose pipes, pressure gauges, hydraulic valves, Quick disconnecting couplers, and much more.\n\n"
                                "Our products are made from high-quality materials and comply with the prescribed quality standards. Owing to their high quality and easy availability, the demand for our range is increasing at a rapid rate.\n\n"
                                "We make sure that our products comprise all the features that a client wants to see in their desirable product range.",
                                style: TextStyle(
                                  fontSize: 21,
                                  color: Colors.black.withOpacity(0.8),
                                ),
                              ),
                            ),
                          ),

                          // ✅ Carousel Slider (on Large Screens)
                          Expanded(
                            flex: 1,
                            child: _buildCarouselSlider(height: 300),
                          ),
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // ✅ Carousel Slider (on Small Screens)
                          _buildCarouselSlider(height: 200),

                          const SizedBox(height: 20),

                          // ✅ Text Section (on Small Screens)
                          Text(
                            "Instant Hydro Tech was established in the year 2024 and carved a niche as the leading manufacturer and trader of a wide range of Hydraulic jacks, cylinders, hand pumps, power pack units, workshop press, hose pipes, pressure gauges, hydraulic valves, Quick disconnecting couplers, and much more.\n\n"
                            "Our products are made from high-quality materials and comply with the prescribed quality standards. Owing to their high quality and easy availability, the demand for our range is increasing at a rapid rate.\n\n"
                            "We make sure that our products comprise all the features that a client wants to see in their desirable product range.",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black.withOpacity(0.8),
                            ),
                          ),
                        ],
                      ),
              ),
              ProductRange(),
              IndustriesWeCater()
              // //  Get Started Button (Wrapped in a Center Widget)
              // Center(
              //   child: FittedBox(
              //     child: Container(
              //       margin: const EdgeInsets.symmetric(vertical: 20),
              //       padding: const EdgeInsets.all(15),
              //       decoration: BoxDecoration(
              //         color: const Color(0xFF372930),
              //         borderRadius: BorderRadius.circular(34),
              //       ),
              //       child: Row(
              //         children: <Widget>[
              //           Container(
              //             padding: const EdgeInsets.all(10),
              //             height: 38,
              //             width: 38,
              //             decoration: const BoxDecoration(
              //               color: Color(0xFF372930),
              //               shape: BoxShape.circle,
              //             ),
              //             child: const CircleAvatar(
              //               backgroundColor: Colors.white,
              //             ),
              //           ),
              //           const SizedBox(width: 15),
              //           Text(
              //             "Get Started".toUpperCase(),
              //             style: const TextStyle(
              //               color: Colors.white,
              //               fontWeight: FontWeight.bold,
              //               fontSize: 19,
              //             ),
              //           ),
              //           const SizedBox(width: 15),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  // ✅ Reusable Carousel Slider Widget
  Widget _buildCarouselSlider({required double height}) {
    return CarouselSlider(
      options: CarouselOptions(
        height: height,
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 0.9, // Adjusted for better visibility
      ),
      items: [
        'assets/images/hand_pump1.png',
        'assets/images/hand_pump2.png',
        'assets/images/isl_series.png',
      ].map((imagePath) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            imagePath,
            fit: BoxFit.contain, // Ensures full image is visible
            width: double.infinity,
          ),
        );
      }).toList(),
    );
  }
}
