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
        'Hisham\'s Portfolio',
        style: TextStyle(
          fontSize: isSmallScreen ? 20 : 24,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          letterSpacing: 1.2,
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
              scaffoldKey.currentState?.openEndDrawer(); // ✅ This fixes the issue
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
        style: const TextStyle(fontSize: 18, color: Colors.white),
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
              'Hisham\'s Portfolio',
              style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
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
      title: Text(title, style: const TextStyle(color: Colors.white, fontSize: 18)),
      onTap: () {
        Navigator.pop(context); 
        onItemSelected(index);
      },
    );
  }
}
