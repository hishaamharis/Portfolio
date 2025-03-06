import 'package:flutter/material.dart';
import 'package:portfolio/constants/app_image.dart';
import 'package:portfolio/model/project_model.dart';
import 'package:portfolio/screens/project_detail_screen.dart';
import 'package:portfolio/widgets/project_card.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Project> projects = [
      Project(
          name: 'Drive Duo',
          subtitle: 'Car Rental App',
          description:
              'Car Rental App that allows users to rent cars from other users.',
          imageUrl: 'assets/images/drive_duo.png',
          techStack: [
            'Flutter',
            'Dart',
            'Firebase Core',
            'Firebase Authentication',
            'Provider',
            'Razorpay',
          ],
          githubUrl: 'https://github.com/hishaamharis/drive_duo.git'),
      Project(
        name: 'Quiz!z',
        subtitle: 'A quiz app.',
        description:
            'A quiz app.Used to test your knowledge with multiple choice questions in different categories',
        imageUrl: 'assets/images/quiziz.png', // Replace with your image path
        techStack: [
          'Flutter',
          'Dart',
          'Firebase Core',
          'Firebase Authentication',
          'Google Sign-In',
          'Cloud Firestore',
          'Flutter Native Splash',
        ],
      ),
      Project(
          name: 'Task manager',
          subtitle: 'A task management app.',
          description: 'A task management app.Used to manage your daily tasks',
          imageUrl:
              'assets/images/task_manager.png', // Replace with your image path
          techStack: [
            'Flutter',
            'Dart',
            'GetX',
            'Hive',
            'Hive Flutter',
            'UUID',
            'Intl',
          ],
          githubUrl: "https://github.com/hishaamharis/task_manager.git"),
      Project(
        name: 'Projectsmate',
        subtitle: 'A project management app',
        description: 'A project management app',
        imageUrl: AppImage.projectsmateImage,
        techStack: [
          'Flutter',
          'Dart',
          'Dio',
          'Awesome Dio Interceptor',
          'Firebase Core',
          'Firebase Authentication',
          'Google Sign-In',
          'GoRouter',
          'Provider',
          'Shared Preferences',
          'Flutter Secure Storage',
        ],
      ),
    ];

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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'My Projects',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    int crossAxisCount = 3; // Default: 3 cards per row

                    if (constraints.maxWidth < 600) {
                      crossAxisCount = 2; // Medium screens: 2 cards per row
                    }
                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        childAspectRatio:
                            1.4, // Adjust for better card proportions
                      ),
                      itemCount: projects.length,
                      itemBuilder: (context, index) {
                        return ProjectCard(
                          project: projects[index],
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProjectDetailsScreen(
                                  project: projects[index],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
