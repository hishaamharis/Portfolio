import 'package:flutter/material.dart';
import 'package:portfolio/constants/app_image.dart';
import 'package:portfolio/theme/app_colors.dart';
import 'package:portfolio/theme/app_typography.dart';
import 'package:portfolio/widgets/section_reveal.dart';
import 'package:portfolio/widgets/skill_chip.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 700;
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
                  Text('01 · ABOUT', style: AppType.eyebrow()),
                  const SizedBox(height: 24),
                  Text(
                    'Building things that work.',
                    style: AppType.display(
                      size: isMobile ? 36 : 56,
                      height: 1.05,
                    ),
                  ),
                  const SizedBox(height: 40),
                  isMobile
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _portrait(isMobile: true),
                            const SizedBox(height: 32),
                            _bio(),
                          ],
                        )
                      : Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(flex: 3, child: _bio()),
                            const SizedBox(width: 64),
                            Expanded(flex: 2, child: _portrait()),
                          ],
                        ),
                  const SizedBox(height: 56),
                  Text('STACK', style: AppType.eyebrow(color: AppColors.mute)),
                  const SizedBox(height: 20),
                  const _SkillsGroup(
                    title: 'Build',
                    chips: [
                      SkillChip(label: 'Flutter', primary: true),
                      SkillChip(label: 'Dart'),
                      SkillChip(label: 'Bloc'),
                      SkillChip(label: 'Provider'),
                      SkillChip(label: 'Riverpod'),
                      SkillChip(label: 'GetX'),
                      SkillChip(label: 'Firebase'),
                      SkillChip(label: 'Firestore'),
                      SkillChip(label: 'REST APIs'),
                      SkillChip(label: 'Dio'),
                      SkillChip(label: 'Hive'),
                      SkillChip(label: 'SQLite'),
                      SkillChip(label: 'Animations'),
                      SkillChip(label: 'Custom Widgets'),
                      SkillChip(label: 'Responsive UI'),
                      SkillChip(label: 'Push Notifications'),
                      SkillChip(label: 'Google Maps'),
                      SkillChip(label: 'Payment Gateways'),
                      SkillChip(label: 'Play Store / App Store'),
                      SkillChip(label: 'Android Studio'),
                      SkillChip(label: 'Git & GitHub'),
                      SkillChip(label: 'Postman'),
                      SkillChip(label: 'UI / UX'),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const _SkillsGroup(
                    title: 'Delivery',
                    chips: [
                      SkillChip(label: 'Agile'),
                      SkillChip(label: 'Scrum'),
                      SkillChip(label: 'Sprint Planning'),
                      SkillChip(label: 'Roadmapping'),
                      SkillChip(label: 'Stakeholder Mgmt'),
                      SkillChip(label: 'Jira'),
                      SkillChip(label: 'Notion'),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const _SkillsGroup(
                    title: 'Quality',
                    chips: [
                      SkillChip(label: 'Test Strategy'),
                      SkillChip(label: 'Manual QA'),
                      SkillChip(label: 'Regression Testing'),
                      SkillChip(label: 'Bug Triage'),
                      SkillChip(label: 'Test Cases'),
                      SkillChip(label: 'UAT'),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _bio() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "I'm a Flutter developer based in Kerala, currently shipping cross-platform apps and managing the projects they live inside.",
          style: AppType.body(size: 18, height: 1.55),
        ),
        const SizedBox(height: 20),
        Text(
          'I started in QA — testing other people\'s software taught me how easily things break, and that perspective shapes everything I build now. I write code that I\'d trust to ship, and lead releases the same way.',
          style: AppType.body(size: 16, color: AppColors.mute, height: 1.6),
        ),
        const SizedBox(height: 20),
        Text(
          'When I\'m not in code, I\'m planning, prioritising, or quietly arguing for less scope.',
          style: AppType.body(size: 16, color: AppColors.mute, height: 1.6),
        ),
      ],
    );
  }

  Widget _portrait({bool isMobile = false}) {
    return ClipRRect(
      borderRadius: BorderRadius.zero,
      child: AspectRatio(
        aspectRatio: 4 / 5,
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.border, width: 1),
            image: const DecorationImage(
              image: AssetImage(AppImage.meImage),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

class _SkillsGroup extends StatelessWidget {
  final String title;
  final List<SkillChip> chips;

  const _SkillsGroup({required this.title, required this.chips});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title.toUpperCase(),
          style: AppType.mono(
            size: 10,
            color: AppColors.mute,
            letterSpacing: 1.6,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: chips,
        ),
      ],
    );
  }
}
