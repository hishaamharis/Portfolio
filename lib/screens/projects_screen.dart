import 'package:flutter/material.dart';
import 'package:portfolio/data/project_data.dart';
import 'package:portfolio/screens/project_detail_screen.dart';
import 'package:portfolio/widgets/project_card.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xff0A192F),
              Color(0xff172A45),
              Color(0xff203A4C),
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
              const Text(
                'Tap on a project to view details →', // Add this line
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white70, // Use a subtle color
                  fontStyle: FontStyle.italic,
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
