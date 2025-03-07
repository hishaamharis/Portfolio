import 'package:flutter/material.dart';
import 'package:portfolio/screens/about_screen.dart';
import 'package:portfolio/screens/contact_screen.dart';
import 'package:portfolio/screens/home_screen.dart';
import 'package:portfolio/screens/projects_screen.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'widgets/navbar.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PortfolioPage(),
    );
  }
}

class PortfolioPage extends StatelessWidget {
  PortfolioPage({super.key});

  final ItemScrollController _scrollController = ItemScrollController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void scrollToSection(int index) {
    _scrollController.scrollTo(
      index: index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: Drawer(
        child: Container(
          color: const Color(0xFF1A1A2E),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              _drawerItem('Home', 0),
              _drawerItem('About', 1),
              _drawerItem('Projects', 2),
              _drawerItem('Contact', 3),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          NavBar(onItemSelected: scrollToSection, scaffoldKey: _scaffoldKey),
          Expanded(
            child: ScrollablePositionedList.builder(
              itemScrollController: _scrollController,
              itemCount: 4,
              itemBuilder: (context, index) {
                if (index == 3) {
                  return Column(
                    mainAxisSize:
                        MainAxisSize.min, // Takes only the space it needs
                    children: [
                      _getSection(index), // ContactScreen
                    ],
                  );
                } else {
                  // Other sections with fixed height
                  return SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: _getSection(index),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _drawerItem(String title, int index) {
    return ListTile(
      title: Text(title,
          style: const TextStyle(color: Colors.white, fontSize: 18)),
      onTap: () {
        scrollToSection(index);
        _scaffoldKey.currentState?.closeEndDrawer();
      },
    );
  }

  Widget _getSection(int index) {
    switch (index) {
      case 0:
        return const HomeScreen();
      case 1:
        return const AboutScreen();
      case 2:
        return const ProjectsScreen();
      case 3:
        return const ContactScreen();
      default:
        return const SizedBox.shrink();
    }
  }
}
