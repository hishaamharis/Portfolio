import 'package:flutter/material.dart';
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
        description: 'Car Rental App',
        imageUrl: 'assets/images/drive_duo.png',
        techStack: ['Flutter', 'Firebase'],
        githubUrl: 'https://github.com/hishaamharis/drive_duo.git'
      ),
      Project(
        name: 'Quiz!z',
        description: 'A quiz app',
        imageUrl: 'assets/images/quiziz.png', // Replace with your image path
        techStack: ['Flutter, Firebase'],
      ),
      Project(
        name: 'Task manager',
        description: 'A task management app',
        imageUrl: 'assets/images/task_manager.png', // Replace with your image path
        techStack: ['Flutter, Firebase'],
        githubUrl: "https://github.com/hishaamharis/task_manager.git"
      ),
      Project(
        name: 'Projectsmate',
        description: 'A project management app',
        imageUrl:
            'assets/images/projectsmate.png', // Replace with your image path
        techStack: ['Flutter, Firebase, Rest API,'],
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
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, // Increase to 3 cards per row
                    crossAxisSpacing: 8, // Spacing between columns
                    mainAxisSpacing: 8, // Spacing between rows
                    childAspectRatio: 1.5, // Adjust card aspect ratio
                  ),
                  itemCount: projects.length,
                  itemBuilder: (context, index) {
                    return ProjectCard(
                      project: projects[index],
                      onTap: () {
                        // Navigate to the project details screen
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}