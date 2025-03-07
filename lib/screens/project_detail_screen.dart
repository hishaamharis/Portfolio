import 'package:flutter/material.dart';
import 'package:portfolio/widgets/hoverable_button.dart';
import 'package:portfolio/widgets/hoverable_tech_container.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:portfolio/model/project_model.dart';

class ProjectDetailsScreen extends StatelessWidget {
  final Project project;

  const ProjectDetailsScreen({super.key, required this.project});

  void _launchGitHub() async {
    if (project.githubUrl != null && project.githubUrl!.isNotEmpty) {
      final Uri url = Uri.parse(project.githubUrl!);
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      } else {
        debugPrint('Could not launch $url');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 600;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          project.name,
          style:
              const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: const Color(0xff0D253F),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xff0D253F), Color(0xff1B3A57)],
          ),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 16.0 : 40.0,
            vertical: 20.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  constraints: BoxConstraints(
                    maxHeight: isMobile ? 200 : 300,
                  ),
                  child: Image.asset(
                    project.imageUrl,
                    width: double.infinity,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                project.name,
                style: TextStyle(
                  fontSize: isMobile ? 24 : 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                project.description,
                style: TextStyle(
                  fontSize: isMobile ? 14 : 16,
                  color: Colors.white70,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Tech Stack',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                alignment:
                    isMobile ? WrapAlignment.center : WrapAlignment.start,
                children: project.techStack
                    .map((tech) => HoverableTechContainer(tech: tech))
                    .toList(),
              ),
              const SizedBox(height: 24),
              if (project.githubUrl != null && project.githubUrl!.isNotEmpty)
                Center(
                  child: HoverableButton(
                    onPressed: _launchGitHub,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
