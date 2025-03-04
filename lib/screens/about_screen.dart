import 'package:flutter/material.dart';
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
                    border:Border.all(color: const Color(0xFFF9EBEB).withOpacity(0.1), width: 0.5),
                  ),
                  child: const Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'About Me',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'I am a Flutter Developer with experience in building mobile and web applications. '
                        'I specialize in creating clean, efficient, and user-friendly apps that deliver a seamless experience.',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white70,
                          height: 1.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 80),
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: [
                          SkillChip(label: 'Flutter', icon: Icons.code,color: Color(0xFF2E93FF),),
                          SkillChip(label: 'Dart', icon: Icons.developer_mode,color: Color(0xFF8CA0C6),),
                          SkillChip(label: 'Firebase', icon: Icons.cloud,color: Color(0xFFE54A42),),
                          SkillChip(label: 'UI/UX Design', icon: Icons.design_services,color: Color(0xFFC6BDE0),),
                          SkillChip(label: 'REST APIs', icon: Icons.api,color: Color(0xFFD0A818),),
                          SkillChip(label: 'State Management', icon: Icons.settings,color: Color(0xFF048677),),
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