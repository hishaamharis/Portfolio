import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/constants/app_icons.dart';
import 'package:portfolio/widgets/skill_chip.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xff0A192F), // Dark blue
              Color(0xff172A45), // Slightly lighter blue
              Color(0xff203A4C), // Even lighter blue
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth < 500 ? 10 : 20, // Adjust padding for smaller screens
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Animated Card
                AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                  padding: EdgeInsets.all(screenWidth < 500 ? 15 : 20), // Adjust padding
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFFFFF).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                    border: Border.all(
                      color: const Color(0xFFF9EBEB).withOpacity(0.1),
                      width: 0.5,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'About Me',
                        style: TextStyle(
                          fontSize: screenWidth < 500 ? 26 : 32, // Reduce text size for mobile
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'I am a Flutter Developer with experience in building mobile and web applications. '
                        'I specialize in creating clean, efficient, and user-friendly apps that deliver a seamless experience.',
                        style: TextStyle(
                          fontSize: screenWidth < 500 ? 16 : 18, // Adjust font size
                          color: Colors.white70,
                          height: 1.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 40), // Adjust spacing
                      Wrap(
                        spacing: screenWidth < 500 ? 5 : 10, // Adjust spacing
                        runSpacing: screenWidth < 500 ? 5 : 10,
                        alignment: WrapAlignment.center,
                        children: [
                          SkillChip(
                            label: 'Flutter',
                            icon: SvgPicture.asset(AppIcons.flutterIcon),
                          ),
                          SkillChip(
                            label: 'Dart',
                            icon: SvgPicture.asset(AppIcons.dartIcon),
                          ),
                          SkillChip(
                            label: 'Firebase',
                            icon: SvgPicture.asset(AppIcons.firebaseIcon),
                          ),
                          SkillChip(
                            label: 'UI/UX Design',
                            icon: SvgPicture.asset(AppIcons.uiuxDesignIcon),
                          ),
                          SkillChip(
                            label: 'REST APIs',
                            icon: SvgPicture.asset(AppIcons.restApiIcon),
                          ),
                          SkillChip(
                            label: 'State Management',
                            icon: SvgPicture.asset(AppIcons.stateManagementIcon),
                          ),
                          SkillChip(
                            label: 'Android Studio',
                            icon: SvgPicture.asset(AppIcons.androidStudioIcon),
                          ),
                          SkillChip(
                            label: 'GitHub',
                            icon: SvgPicture.asset(AppIcons.githubIcon),
                          ),
                          SkillChip(
                            label: 'Databases',
                            icon: SvgPicture.asset(AppIcons.databaseIcon),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
