import 'package:flutter/material.dart';
import 'package:portfolio/screens/about_screen.dart';
import 'package:portfolio/screens/contact_screen.dart';
import 'package:portfolio/screens/home_screen.dart';
import 'package:portfolio/screens/projects_screen.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'widgets/navbar.dart';

void main() {
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
      body: Column(
        children: [
          NavBar(onItemSelected: scrollToSection,),
          Expanded(
            child: ScrollablePositionedList.builder(
              itemScrollController: _scrollController,
              itemCount: 4,
              itemBuilder: (context, index) {
                return Container(
                  height: MediaQuery.of(context).size.height,
                  alignment: Alignment.center,
                  child: _getSection(index),
                );
              },
            ),
          ),
        ],
      ),
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