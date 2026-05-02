import 'package:flutter/material.dart';
import 'package:portfolio/theme/app_colors.dart';
import 'package:portfolio/theme/app_motion.dart';
import 'package:portfolio/theme/app_typography.dart';
import 'package:portfolio/widgets/section_reveal.dart';
import 'package:url_launcher/url_launcher.dart';

class _AnimatedSignatureName extends StatefulWidget {
  final String text;
  final double size;

  const _AnimatedSignatureName({required this.text, required this.size});

  @override
  State<_AnimatedSignatureName> createState() => _AnimatedSignatureNameState();
}

class _AnimatedSignatureNameState extends State<_AnimatedSignatureName>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _wipe;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1600),
    );
    _wipe = CurvedAnimation(parent: _controller, curve: AppMotion.easeInOut);
    _wipe.addListener(() => setState(() {}));
    Future.delayed(const Duration(milliseconds: 700), () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final p = _wipe.value;
    return ShaderMask(
      blendMode: BlendMode.dstIn,
      shaderCallback: (bounds) {
        const softEdge = 0.06;
        final pos = -softEdge + p * (1 + 2 * softEdge);
        final s1 = (pos - softEdge).clamp(0.0, 1.0);
        final s2 = (pos + softEdge).clamp(0.0, 1.0);
        final stops = s1 >= s2
            ? <double>[s1, (s1 + 0.0001).clamp(0.0, 1.0)]
            : <double>[s1, s2];
        return LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          stops: stops,
          colors: const [Colors.white, Colors.transparent],
        ).createShader(bounds);
      },
      child: Text(
        widget.text,
        style: AppType.signature(size: widget.size),
      ),
    );
  }
}

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
                FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: Transform.rotate(
                    angle: -0.035,
                    alignment: Alignment.centerLeft,
                    child: _AnimatedSignatureName(
                      text: 'Muhammad Hisham',
                      size: nameSize,
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
