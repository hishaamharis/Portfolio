import 'package:url_launcher/url_launcher.dart';

class LaunchServices {
  static Future<void> launchEmail(String email) async {
    final Uri emailUri = Uri.parse('mailto:$email');
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      print('Could not launch email: $email');
    }
  }

  static Future<void> launchWebsite(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      print('Could not launch URL: $url');
    }
  }
}
