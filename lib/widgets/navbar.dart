import 'package:flutter/material.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  final Function(int) onItemSelected;
  final GlobalKey<ScaffoldState> scaffoldKey;

  const NavBar({super.key, required this.onItemSelected, required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isSmallScreen = screenWidth < 600;

    return AppBar(
      backgroundColor: const Color(0xFF1A1A2E),
      title: Text(
        'Muhammad Hisham H', // ✅ Updated Title
        style: TextStyle(
          fontSize: isSmallScreen ? 20 : 24,
          fontFamily: 'MonteCarlo', 
          fontWeight: FontWeight.w400,
          color: Colors.white,
          letterSpacing: 1.5,
        ),
      ),
      actions: [
        if (!isSmallScreen) ...[
          _navButton('Home', 0),
          _navButton('About', 1),
          _navButton('Projects', 2),
          _navButton('Contact', 3),
          const SizedBox(width: 10),
        ] else
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () {
              scaffoldKey.currentState?.openEndDrawer();
            },
          ),
      ],
    );
  }

  Widget _navButton(String title, int index) {
    return TextButton(
      onPressed: () => onItemSelected(index),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class NavigationDrawer extends StatelessWidget {
  final Function(int) onItemSelected;

  const NavigationDrawer({super.key, required this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 16.0,
      backgroundColor: const Color(0xFF1A1A2E),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Color(0xFF16213E)),
            child: Text(
              'Muhammad Hisham H', // ✅ Updated Drawer Title
              style: TextStyle(
                fontSize: 24,
                fontStyle: FontStyle.italic, // ✅ Italic Style
                fontFamily: 'Poppins', // ✅ Beautiful Font
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1.2,
              ),
            ),
          ),
          _drawerItem(context, 'Home', 0),
          _drawerItem(context, 'About', 1),
          _drawerItem(context, 'Projects', 2),
          _drawerItem(context, 'Contact', 3),
        ],
      ),
    );
  }

  Widget _drawerItem(BuildContext context, String title, int index) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
      ),
      onTap: () {
        Navigator.pop(context);
        onItemSelected(index);
      },
    );
  }
}
