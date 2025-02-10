import 'package:flutter/material.dart';

import 'Components/app_bar.dart';
import 'Components/body.dart';
import 'Components/contact_us.dart';
import 'Components/products.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width  of our screen
    return Scaffold(
      endDrawer: CustomDrawer(),
      body: Container(
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.amber, Colors.black], // Change colors as needed
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: CustomAppBar(), //  App Bar at the top
            ),
            const SliverFillRemaining(
              hasScrollBody: true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Body(),

                  ContactUs(),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
