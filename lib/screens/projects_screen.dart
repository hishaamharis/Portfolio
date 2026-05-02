import 'package:flutter/material.dart';
import 'package:portfolio/data/project_data.dart';
import 'package:portfolio/screens/project_detail_screen.dart';
import 'package:portfolio/theme/app_colors.dart';
import 'package:portfolio/theme/app_typography.dart';
import 'package:portfolio/widgets/project_card.dart';
import 'package:portfolio/widgets/section_reveal.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 700;
    final bool isNarrow = screenWidth < 420;
    final bool useSingleColumn = screenWidth < 900;
    final double horizontalPad = isMobile ? 24 : 80;

    return Container(
      color: AppColors.ink,
      padding: EdgeInsets.symmetric(horizontal: horizontalPad, vertical: 80),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: SectionReveal(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('02 · WORK', style: AppType.eyebrow()),
                const SizedBox(height: 24),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Selected work, 2024 – 2026.',
                    style: AppType.display(
                      size: isNarrow ? 26 : (isMobile ? 32 : 44),
                      height: 1.1,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                if (useSingleColumn)
                  Column(
                    children: [
                      for (int i = 0; i < projects.length; i++) ...[
                        if (i > 0) const SizedBox(height: 16),
                        _buildCard(context, i),
                      ],
                    ],
                  )
                else
                  LayoutBuilder(
                    builder: (context, constraints) {
                      const spacing = 16.0;
                      final cardWidth =
                          (constraints.maxWidth - spacing) / 2;
                      return Wrap(
                        spacing: spacing,
                        runSpacing: spacing,
                        children: List.generate(
                          projects.length,
                          (i) => SizedBox(
                            width: cardWidth,
                            child: _buildCard(context, i),
                          ),
                        ),
                      );
                    },
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, int index) {
    return ProjectCard(
      project: projects[index],
      index: index,
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (_, __, ___) =>
                ProjectDetailsScreen(project: projects[index]),
            transitionsBuilder: (_, animation, __, child) {
              return FadeTransition(opacity: animation, child: child);
            },
            transitionDuration: const Duration(milliseconds: 300),
          ),
        );
      },
    );
  }
}
