import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/constants/app_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF1A1A2E), // Dark blue
            Color(0xFF16213E), // Slightly lighter blue
          ],
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Social Links with Icons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _footerLink(
                icon: SvgPicture.asset(AppIcons.githubIcon),
                title: 'GitHub',
                url: 'https://github.com/hishaamharis',
              ),
              const SizedBox(width: 20),
              _footerLink(
                icon: SvgPicture.asset(AppIcons.linkedinIcon),
                title: 'LinkedIn',
                url: 'https://www.linkedin.com/in/muhammad-hisham-h/',
              ),
              const SizedBox(width: 20),
              _footerLink(
                icon: SvgPicture.asset(AppIcons.instagramIcon),
                title: 'Instagram',
                url: 'https://www.instagram.com/hishaamharis/',
              ),
            ],
          ),
          const SizedBox(height: 10),
          // Copyright Text
          const Text(
            '© 2025 Muhammad Hisham. All Rights Reserved.',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _footerLink({
    required SvgPicture icon,
    required String title,
    required String url,
  }) {
    return InkWell(
      onTap: () => _launchUrl(url),
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          const SizedBox(width: 8),
          Text(
            title,
            style: const TextStyle(
              color: Color(0xff94acf4),
              fontSize: 16,
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }

  void _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }
}