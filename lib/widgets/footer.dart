import 'package:flutter/material.dart';
import 'package:portfolio/theme/app_colors.dart';
import 'package:portfolio/theme/app_motion.dart';
import 'package:portfolio/theme/app_typography.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 700;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 48,
        vertical: 32,
      ),
      decoration: const BoxDecoration(
        color: AppColors.ink,
        border: Border(
          top: BorderSide(color: AppColors.border, width: 1),
        ),
      ),
      child: isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _socials(),
                const SizedBox(height: 16),
                _copy(),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _copy(),
                _socials(),
              ],
            ),
    );
  }

  Widget _copy() {
    return Text(
      '© 2026 Muhammad Hisham',
      style: AppType.mono(color: AppColors.mute),
    );
  }

  Widget _socials() {
    return const Wrap(
      spacing: 24,
      runSpacing: 8,
      children: [
        _FooterLink(label: 'GitHub', url: 'https://github.com/hishaamharis'),
        _FooterLink(
          label: 'LinkedIn',
          url: 'https://www.linkedin.com/in/muhammad-hisham-h/',
        ),
        _FooterLink(
          label: 'Instagram',
          url: 'https://www.instagram.com/hishaamharis/',
        ),
      ],
    );
  }
}

class _FooterLink extends StatefulWidget {
  final String label;
  final String url;

  const _FooterLink({required this.label, required this.url});

  @override
  State<_FooterLink> createState() => _FooterLinkState();
}

class _FooterLinkState extends State<_FooterLink> {
  bool _hovered = false;

  Future<void> _open() async {
    final uri = Uri.parse(widget.url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: _open,
        behavior: HitTestBehavior.opaque,
        child: AnimatedDefaultTextStyle(
          duration: AppMotion.hover,
          curve: AppMotion.easeOut,
          style: AppType.mono(
            color: _hovered ? AppColors.accent : AppColors.mute,
          ),
          child: Text(widget.label),
        ),
      ),
    );
  }
}
