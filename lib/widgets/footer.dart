import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/constants/app_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final bool isMobile = screenSize.width < 600;

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 15 : 20,
        horizontal: isMobile ? 10 : 20,
      ),
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
          // Social Links with Icons - Responsive Layout
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _footerLink(
                icon: AppIcons.githubIcon,
                title: 'GitHub',
                url: 'https://github.com/hishaamharis',
                isMobile: isMobile,
              ),
              SizedBox(width: isMobile ? 10 : 20),
              _footerLink(
                icon: AppIcons.linkedinIcon,
                title: 'LinkedIn',
                url: 'https://www.linkedin.com/in/muhammad-hisham-h/',
                isMobile: isMobile,
              ),
              SizedBox(width: isMobile ? 10 : 20),
              _footerLink(
                icon: AppIcons.instagramIcon,
                title: 'Instagram',
                url: 'https://www.instagram.com/hishaamharis/',
                isMobile: isMobile,
              ),
            ],
          ),
          SizedBox(height: isMobile ? 8 : 12),
          // Copyright Text
          Text(
            '© 2025 Muhammad Hisham. All Rights Reserved.',
            style: TextStyle(
              color: Colors.white70,
              fontSize: isMobile ? 12 : 14,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _footerLink({
    required String icon,
    required String title,
    required String url,
    required bool isMobile,
  }) {
    return InkWell(
      onTap: () => _launchUrl(url),
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(icon, width: isMobile ? 20 : 24),
          SizedBox(width: isMobile ? 6 : 8),
          Text(
            title,
            style: TextStyle(
              color: const Color(0xff94acf4),
              fontSize: isMobile ? 14 : 16,
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
