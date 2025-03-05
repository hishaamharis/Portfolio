import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/constants/app_icons.dart';
import 'package:portfolio/widgets/skill_chip.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Animated Card
                AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                  padding: const EdgeInsets.all(20),
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
                        width: 0.5),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'About Me',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'I am a Flutter Developer with experience in building mobile and web applications. '
                        'I specialize in creating clean, efficient, and user-friendly apps that deliver a seamless experience.',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white70,
                          height: 1.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 80),
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
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
                            icon: SvgPicture.asset(
                              AppIcons.uiuxDesignIcon,
                            ),
                          ),
                          SkillChip(
                            label: 'REST APIs',
                            icon: SvgPicture.asset(AppIcons.restApiIcon),
                          ),
                          SkillChip(
                            label: 'State Management',
                            icon:
                                SvgPicture.asset(AppIcons.stateManagementIcon),
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
