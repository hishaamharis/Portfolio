import 'package:http/http.dart' as http;
import 'dart:convert';

class EmailService {
  static Future<void> sendMessage(String name, String email, String message) async {
    const serviceId = 'service_5lahwvs';  
    const templateId = 'template_g1nll9x'; 
    const userId = 'S83pSyIpNv_V_jzxl'; 

    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': userId,
        'template_params': {
          'user_name': name,
          'user_email': email,
          'user_message': message,
        }
      }),
    );

    if (response.statusCode == 200) {
      print('✅ Message sent successfully');
    } else {
      print('❌ Failed to send message: ${response.body}');
    }
  }
}
