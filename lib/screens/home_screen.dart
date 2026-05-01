import 'package:flutter/material.dart';
import 'package:portfolio/theme/app_colors.dart';
import 'package:portfolio/theme/app_motion.dart';
import 'package:portfolio/theme/app_typography.dart';
import 'package:portfolio/widgets/section_reveal.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<void> _downloadResume() async {
    final uri = Uri.parse(
      'https://drive.google.com/uc?export=download&id=18pZVazUU_rXt5Dq_MhBW_PhcTqDdG5Mh',
    );
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 700;
    final bool isNarrow = screenWidth < 420;
    final double horizontalPad = isMobile ? 24 : 80;

    final double greetingSize = isNarrow ? 24 : (isMobile ? 28 : 44);
    final double nameSize = isNarrow ? 48 : (isMobile ? 64 : 96);

    return Container(
      color: AppColors.ink,
      padding: EdgeInsets.symmetric(horizontal: horizontalPad),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: SectionReveal(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'FLUTTER DEVELOPER · PROJECT MANAGER',
                  style: AppType.eyebrow(),
                ),
                const SizedBox(height: 28),
                Text(
                  "Hi, I'm",
                  style: AppType.display(
                    size: greetingSize,
                    weight: FontWeight.w400,
                    height: 1.0,
                  ),
                ),
                const SizedBox(height: 8),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: Transform.rotate(
                    angle: -0.035,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Muhammad Hisham',
                      style: AppType.signature(size: nameSize),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 480),
                  child: Text(
                    'I build cross-platform apps with Flutter, lead them through to release as a project manager, and keep the bar high — informed by years on the QA side.',
                    style: AppType.body(
                      size: isMobile ? 15 : 16,
                      color: AppColors.mute,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                _ResumeButton(onTap: _downloadResume),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ResumeButton extends StatefulWidget {
  final VoidCallback onTap;
  const _ResumeButton({required this.onTap});

  @override
  State<_ResumeButton> createState() => _ResumeButtonState();
}

class _ResumeButtonState extends State<_ResumeButton> {
  bool _hovered = false;
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTapDown: (_) => setState(() => _pressed = true),
        onTapUp: (_) {
          setState(() => _pressed = false);
          widget.onTap();
        },
        onTapCancel: () => setState(() => _pressed = false),
        child: AnimatedScale(
          scale: _pressed ? 0.96 : 1.0,
          duration: AppMotion.hover,
          curve: AppMotion.easeOut,
          child: AnimatedContainer(
            duration: AppMotion.hover,
            curve: AppMotion.easeOut,
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
            decoration: BoxDecoration(
              color: _hovered ? AppColors.accent : Colors.transparent,
              border: Border.all(
                color: AppColors.accent,
                width: 1,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'DOWNLOAD RESUME',
                  style: AppType.mono(
                    size: 12,
                    letterSpacing: 1.6,
                    weight: FontWeight.w600,
                    color: _hovered ? AppColors.ink : AppColors.accent,
                  ),
                ),
                const SizedBox(width: 12),
                Icon(
                  Icons.arrow_outward,
                  size: 16,
                  color: _hovered ? AppColors.ink : AppColors.accent,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
