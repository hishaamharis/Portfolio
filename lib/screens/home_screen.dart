import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/constants/app_image.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Function to download resume
  void _downloadResume() async {
    const url = 'https://drive.google.com/uc?export=download&id=18pZVazUU_rXt5Dq_MhBW_PhcTqDdG5Mh';
    final uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      debugPrint("Could not launch $url");
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double avatarRadius = screenWidth < 600 ? 60 : 80;
    double titleFontSize = screenWidth < 600 ? 26 : 32;
    double subtitleFontSize = screenWidth < 600 ? 18 : 22;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xff16213e),
              Color(0xff0f3460),
              Color(0xff1a1a2e),
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: avatarRadius,
                  backgroundImage: const AssetImage(AppImage.meImage),
                  backgroundColor: Colors.transparent,
                ),
                const SizedBox(height: 20),
                Text(
                  "Hello, I'm Muhammad Hisham!",
                  style: GoogleFonts.poppins(
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1.2,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Text(
                  "Flutter Developer | Mobile & Web Apps",
                  style: GoogleFonts.poppins(
                    fontSize: subtitleFontSize,
                    color: Colors.white70,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: _downloadResume,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.download, color: Colors.white, size: 20),
                        const SizedBox(width: 8),
                        Flexible(
                          child: Text(
                            "Resume",
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
