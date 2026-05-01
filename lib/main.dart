import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/screens/about_screen.dart';
import 'package:portfolio/screens/contact_screen.dart';
import 'package:portfolio/screens/home_screen.dart';
import 'package:portfolio/screens/projects_screen.dart';
import 'package:portfolio/theme/app_colors.dart';
import 'package:portfolio/theme/app_theme.dart';
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
      title: 'Muhammad Hisham — Portfolio',
      theme: AppTheme.build(),
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
      backgroundColor: AppColors.ink,
      endDrawer: Drawer(
        backgroundColor: AppColors.ink,
        shape: const RoundedRectangleBorder(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 24),
              _drawerItem(context, 'Home', 0),
              _drawerItem(context, 'About', 1),
              _drawerItem(context, 'Projects', 2),
              _drawerItem(context, 'Contact', 3),
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
                if (index == 0) {
                  return ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: MediaQuery.of(context).size.height -
                          kToolbarHeight,
                    ),
                    child: _getSection(index),
                  );
                }
                return _getSection(index);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _drawerItem(BuildContext context, String label, int index) {
    return ListTile(
      title: Text(
        label,
        style: GoogleFonts.jetBrainsMono(
          color: AppColors.bone,
          fontSize: 14,
          letterSpacing: 1.2,
        ),
      ),
      onTap: () {
        Navigator.of(context).pop();
        scrollToSection(index);
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
