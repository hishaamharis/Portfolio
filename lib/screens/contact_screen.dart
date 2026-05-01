import 'package:flutter/material.dart';
import 'package:portfolio/services/launch_services.dart';
import 'package:portfolio/theme/app_colors.dart';
import 'package:portfolio/theme/app_typography.dart';
import 'package:portfolio/widgets/contact_form.dart';
import 'package:portfolio/widgets/contact_item.dart';
import 'package:portfolio/widgets/footer.dart';
import 'package:portfolio/widgets/section_reveal.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 700;
    final bool isNarrow = screenWidth < 420;
    final double horizontalPad = isMobile ? 24 : 80;

    return Container(
      color: AppColors.ink,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPad,
              vertical: 80,
            ),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1100),
                child: SectionReveal(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('03 · CONTACT', style: AppType.eyebrow()),
                      const SizedBox(height: 24),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Let's build something.",
                          style: AppType.display(
                            size: isNarrow ? 30 : (isMobile ? 36 : 56),
                            height: 1.05,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 520),
                        child: Text(
                          'Open to freelance, full-time, and the occasional good idea. The fastest way to reach me is email — I read everything.',
                          style: AppType.body(
                            size: 16,
                            color: AppColors.mute,
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: [
                          ContactItem(
                            icon: Icons.alternate_email_rounded,
                            label: 'Email',
                            value: 'muhammadhisham231@gmail.com',
                            onTap: () => LaunchServices.launchEmail(
                              'muhammadhisham231@gmail.com',
                            ),
                          ),
                          ContactItem(
                            icon: Icons.code_rounded,
                            label: 'GitHub',
                            value: 'github.com/hishaamharis',
                            onTap: () => LaunchServices.launchWebsite(
                              'https://github.com/hishaamharis',
                            ),
                          ),
                          ContactItem(
                            icon: Icons.business_center_outlined,
                            label: 'LinkedIn',
                            value: 'linkedin.com/in/muhammad-hisham-h',
                            onTap: () => LaunchServices.launchWebsite(
                              'https://www.linkedin.com/in/muhammad-hisham-h/',
                            ),
                          ),
                          ContactItem(
                            icon: Icons.photo_camera_outlined,
                            label: 'Instagram',
                            value: '@hishaamharis',
                            onTap: () => LaunchServices.launchWebsite(
                              'https://www.instagram.com/hishaamharis/',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 64),
                      isMobile
                          ? const ContactForm()
                          : ConstrainedBox(
                              constraints: const BoxConstraints(maxWidth: 560),
                              child: const ContactForm(),
                            ),
                      const SizedBox(height: 56),
                      Container(
                        height: 1,
                        color: AppColors.border,
                      ),
                      const SizedBox(height: 32),
                      Text(
                        '— yours,',
                        style: AppType.body(
                          size: 16,
                          color: AppColors.mute,
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
                            style: AppType.signature(
                              size: isNarrow ? 36 : (isMobile ? 44 : 56),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const Footer(),
        ],
      ),
    );
  }
}
