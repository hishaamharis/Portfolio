import 'package:flutter/material.dart';
import 'package:portfolio/model/project_model.dart';
import 'package:portfolio/theme/app_colors.dart';
import 'package:portfolio/theme/app_motion.dart';
import 'package:portfolio/theme/app_typography.dart';
import 'package:portfolio/widgets/hoverable_button.dart';
import 'package:portfolio/widgets/hoverable_tech_container.dart';
import 'package:portfolio/widgets/section_reveal.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectDetailsScreen extends StatelessWidget {
  final Project project;

  const ProjectDetailsScreen({super.key, required this.project});

  Future<void> _launchGitHub() async {
    final url = project.githubUrl;
    if (url == null || url.isEmpty) return;
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 700;
    final double horizontalPad = isMobile ? 24 : 80;
    final Color accent = project.accent;

    return Scaffold(
      backgroundColor: AppColors.ink,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: kToolbarHeight,
              padding: EdgeInsets.symmetric(horizontal: horizontalPad),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: AppColors.border, width: 1),
                ),
              ),
              child: Row(
                children: [
                  _BackLink(onTap: () => Navigator.pop(context), accent: accent),
                  const Spacer(),
                  Text(
                    'PROJECT · ${project.year}',
                    style: AppType.mono(letterSpacing: 1.6, color: AppColors.mute),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalPad,
                  vertical: 48,
                ),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 880),
                    child: SectionReveal(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            project.category.toUpperCase(),
                            style: AppType.eyebrow(color: accent),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            project.name,
                            style: AppType.display(
                              size: isMobile ? 40 : 64,
                              height: 1.05,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            project.subtitle,
                            style: AppType.body(
                              size: 18,
                              color: AppColors.mute,
                            ),
                          ),
                          const SizedBox(height: 40),
                          AspectRatio(
                            aspectRatio: 16 / 9,
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.surface,
                                border: Border.all(
                                  color: AppColors.border,
                                  width: 1,
                                ),
                                image: DecorationImage(
                                  image: AssetImage(project.imageUrl),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 48),
                          Text(
                            'OVERVIEW',
                            style: AppType.eyebrow(color: AppColors.mute),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            project.description,
                            style: AppType.body(
                              size: 16,
                              color: AppColors.bone,
                              height: 1.7,
                            ),
                          ),
                          const SizedBox(height: 48),
                          Text(
                            'STACK',
                            style: AppType.eyebrow(color: AppColors.mute),
                          ),
                          const SizedBox(height: 16),
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: project.techStack
                                .map((tech) => HoverableTechContainer(
                                      tech: tech,
                                      accent: accent,
                                    ))
                                .toList(),
                          ),
                          if (project.githubUrl != null &&
                              project.githubUrl!.isNotEmpty) ...[
                            const SizedBox(height: 48),
                            HoverableButton(
                              onPressed: _launchGitHub,
                              label: 'View on GitHub',
                              accent: accent,
                            ),
                          ],
                          const SizedBox(height: 80),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BackLink extends StatefulWidget {
  final VoidCallback onTap;
  final Color accent;

  const _BackLink({required this.onTap, required this.accent});

  @override
  State<_BackLink> createState() => _BackLinkState();
}

class _BackLinkState extends State<_BackLink> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        behavior: HitTestBehavior.opaque,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: AppMotion.hover,
              curve: AppMotion.easeOut,
              transform: Matrix4.translationValues(_hovered ? -2 : 0, 0, 0),
              child: Icon(
                Icons.arrow_back,
                size: 16,
                color: _hovered ? widget.accent : AppColors.mute,
              ),
            ),
            const SizedBox(width: 12),
            AnimatedDefaultTextStyle(
              duration: AppMotion.hover,
              curve: AppMotion.easeOut,
              style: AppType.mono(
                color: _hovered ? widget.accent : AppColors.mute,
                letterSpacing: 1.6,
              ),
              child: const Text('BACK'),
            ),
          ],
        ),
      ),
    );
  }
}
