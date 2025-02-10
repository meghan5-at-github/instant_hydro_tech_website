import 'package:flutter/material.dart';

/*class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(46),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -2),
            blurRadius: 30,
            color: Colors.black.withOpacity(0.16),
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          Image.asset(
            "assets/images/logo.png",
            height: 25,
            alignment: Alignment.topCenter,
          ),
          SizedBox(width: 5),
          Text(
            "Foodi".toUpperCase(),
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Spacer(),
          MenuItem(
            title: "Home",
            press: () {},
          ),
          MenuItem(
            title: "about",
            press: () {},
          ),
          MenuItem(
            title: "Pricing",
            press: () {},
          ),
          MenuItem(
            title: "Contact",
            press: () {},
          ),
          MenuItem(
            title: "Login",
            press: () {},
          ),
          DefaultButton(
            text: "Get Started",
            press: () {},
          ),
        ],
      ),
    );
  }
}*/

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          return _buildDesktopNav();
        } else {
          return _buildMobileNav(context);
        }
      },
    );
  }

  Widget _buildDesktopNav() {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(46),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -2),
            blurRadius: 30,
            color: Colors.black.withOpacity(0.16),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image.asset("assets/images/hydro.jpg", height: 25),
          const SizedBox(width: 5),
          Text(
            "Instant Hydro Tech".toUpperCase(),
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Spacer(),
          MenuItem(title: "Home", press: () {}),
          MenuItem(title: "About Us", press: () {}),
          MenuItem(title: "Products", press: () {}),
          MenuItem(title: "Contact Us", press: () {}),
        ],
      ),
    );
  }

  Widget _buildMobileNav(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Row(
        children: [
          Image.asset("assets/images/hydro.jpg", height: 25),
          const SizedBox(width: 5),
          Text(
            "Instant Hydro Tech".toUpperCase(),
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      actions: [
        Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () {
              Scaffold.of(context).openEndDrawer(); // Opens the drawer
            },
          ),
        )
      ],
    );
  }
}

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blueAccent, Colors.deepPurpleAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius:
                      BorderRadius.circular(8), // Smooth corners for logo
                  child: Image.asset(
                    "assets/images/hydro.jpg",
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  "Instant Hydro Tech",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                    shadows: [
                      Shadow(
                        color: Colors.black.withOpacity(0.3),
                        offset: Offset(2, 2),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                DrawerMenuItem(title: "Home", press: () {}),
                DrawerMenuItem(title: "About Us", press: () {}),
                DrawerMenuItem(title: "Products", press: () {}),
                DrawerMenuItem(title: "Contact Us", press: () {}),

              ],
            ),
          ),
          /*Padding(
            padding: const EdgeInsets.all(16.0),
            child: DefaultButton(text: "Get Started", press: () {}),
          ),*/
        ],
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final String title;
  final VoidCallback press;

  MenuItem({required this.title, required this.press});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: TextButton(
        onPressed: press,
        child: Text(title.toUpperCase(),
            style: TextStyle(color: Colors.black, fontSize: 16)),
      ),
    );
  }
}

class DrawerMenuItem extends StatelessWidget {
  final String title;
  final VoidCallback press;

  DrawerMenuItem({required this.title, required this.press});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title, style: TextStyle(fontSize: 18)),
      onTap: () {
        Navigator.pop(context); // Closes the drawer after clicking
        press();
      },
    );
  }
}

class DefaultButton extends StatelessWidget {
  final String text;
  final VoidCallback press;

  DefaultButton({required this.text, required this.press});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: press,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.amber,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      child: Text(text.toUpperCase(), style: TextStyle(color: Colors.white)),
    );
  }
}
