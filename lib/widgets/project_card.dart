import 'package:flutter/material.dart';
import 'package:portfolio/model/project_model.dart';

class ProjectCard extends StatelessWidget {
  final Project project;
  final VoidCallback onTap;

  const ProjectCard({
    super.key,
    required this.project,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(image: AssetImage(project.imageUrl), fit: BoxFit.cover),
            border: Border.all(
              color: const Color(0xFFF9EBEB),
            )),
        child: Padding(
          padding: const EdgeInsets.all(8.0), // Reduced padding
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                project.name,
                style: const TextStyle(
                  fontSize: 16, // Slightly reduced font size
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                project.description,
                style: const TextStyle(
                  fontSize: 12, // Slightly reduced font size
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
