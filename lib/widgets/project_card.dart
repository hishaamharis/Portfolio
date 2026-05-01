import 'package:flutter/material.dart';
import 'package:portfolio/model/project_model.dart';
import 'package:portfolio/theme/app_colors.dart';
import 'package:portfolio/theme/app_motion.dart';
import 'package:portfolio/theme/app_typography.dart';

class ProjectCard extends StatefulWidget {
  final Project project;
  final int index;
  final VoidCallback onTap;

  const ProjectCard({
    super.key,
    required this.project,
    required this.index,
    required this.onTap,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final Color accent = widget.project.accent;
    final Color borderColor = _hovered ? accent : AppColors.border;
    final Color numberColor = _hovered ? accent : AppColors.border;

    final String index = (widget.index + 1).toString().padLeft(2, '0');
    final String techCount = widget.project.techStack.length.toString().padLeft(2, '0');

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: AppMotion.hover,
          curve: AppMotion.easeOut,
          transform: Matrix4.translationValues(0, _hovered ? -4 : 0, 0),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: AppColors.ink,
            border: Border.all(color: borderColor, width: 1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      '${widget.project.year} · ${widget.project.category} · $techCount stack',
                      style: AppType.mono(size: 11, color: AppColors.mute),
                    ),
                  ),
                  AnimatedDefaultTextStyle(
                    duration: AppMotion.hover,
                    curve: AppMotion.easeOut,
                    style: AppType.signature(size: 36, color: numberColor),
                    child: Text(index),
                  ),
                ],
              ),
              const SizedBox(height: 28),
              Text(
                widget.project.name,
                style: AppType.heading(size: 26),
              ),
              const SizedBox(height: 8),
              Text(
                widget.project.subtitle,
                style: AppType.body(
                  size: 13,
                  color: AppColors.mute,
                  height: 1.5,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 24),
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: widget.project.techStack.take(3).map((tech) {
                  final bool isPrimary = tech.toLowerCase() == 'flutter';
                  return _TechPill(label: tech, primary: isPrimary);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TechPill extends StatelessWidget {
  final String label;
  final bool primary;

  const _TechPill({required this.label, this.primary = false});

  @override
  Widget build(BuildContext context) {
    final Color color = primary ? AppColors.accent : AppColors.mute;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(color: color.withOpacity(primary ? 1 : 0.4), width: 1),
      ),
      child: Text(
        label.toLowerCase(),
        style: AppType.mono(size: 11, color: color, letterSpacing: 0.4),
      ),
    );
  }
}
