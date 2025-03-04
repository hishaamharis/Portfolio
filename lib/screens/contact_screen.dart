import 'package:flutter/material.dart';
import 'package:portfolio/widgets/contact_form.dart';
import 'package:portfolio/widgets/contact_item.dart';
import 'package:portfolio/widgets/footer.dart';
import 'package:portfolio/constants/app_icons.dart';
import 'package:portfolio/services/launch_services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xff0A192F),
              Color(0xff172A45),
              Color(0xff203A4C),
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                child: Column(
                  children: [
                    const Text(
                      'Get in Touch',
                      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Feel free to reach out for collaborations or just a friendly hello!',
                      style: TextStyle(fontSize: 16, color: Colors.white70),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30),
                    Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      alignment: WrapAlignment.center,
                      children: [
                        ContactItem(
                          icon: SvgPicture.asset(AppIcons.mailIcon, height: 24, width: 24),
                          label: 'Email',
                          value: 'muhammadhisham231@gmail.com',
                          onTap: () => LaunchServices.launchEmail('muhammadhisham231@gmail.com'),
                        ),
                        ContactItem(
                          icon: SvgPicture.asset(AppIcons.githubIcon, height: 24, width: 24),
                          label: 'GitHub',
                          value: 'github.com/hishaamharis',
                          onTap: () => LaunchServices.launchEmail('https://github.com/hishaamharis'),
                        ),
                        ContactItem(
                          icon: SvgPicture.asset(AppIcons.linkedinIcon, height: 24, width: 24),
                          label: 'LinkedIn',
                          value: 'linkedin.com/in/muhammad-hisham-h',
                          onTap: () => LaunchServices.launchWebsite('https://www.linkedin.com/in/muhammad-hisham-h/'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    const ContactForm(),
                  ],
                ),
              ),
              const Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
