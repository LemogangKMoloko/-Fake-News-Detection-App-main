import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String _baseUrl = 'http://10.0.2.2:8000/';

  static Future<String> predictNews(String text) async {
    final uri = Uri.parse('$_baseUrl');

    final response = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'text': text}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final label = data['label'];
      return label == 1 ? 'Real News 🟢' : 'Fake News 🔴';
    } else {
      throw Exception('Failed to get prediction');
    }
  }
}
