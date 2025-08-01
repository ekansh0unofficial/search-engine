import 'package:http/http.dart' as http;
import 'dart:convert';

class SearchApi {
  Future<void> checkHealth() async {
    final baseUrl = 'https://searchengine-app.azurewebsites.net';
    final url = Uri.parse('$baseUrl/health');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final body = json.decode(response.body);
        print('✅ Health OK: $body');
      } else {
        print('❌ Error: ${response.statusCode}');
      }
    } catch (e) {
      print('⚠️ Exception: $e');
    }
  }

  Future<List<Map<String, dynamic>>> searchItem(String search) async {
    List<Map<String, dynamic>> items = [];

    final baseUrl = 'https://searchengine-app.azurewebsites.net';
    ;
    final url = Uri.parse('$baseUrl/search?query=$search&top_k=5');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final decoded = json.decode(response.body);

        if (decoded is List) {
          // Assuming response is a list of maps
          items = List<Map<String, dynamic>>.from(decoded);
        } else if (decoded is Map<String, dynamic>) {
          // If it's a map, wrap it in a list
          items = [decoded];
        } else {
          print("⚠️ Unexpected response type: ${decoded.runtimeType}");
        }
      } else {
        print('❌ Error: ${response.statusCode}');
      }
    } catch (e) {
      print('⚠️ Exception: $e');
    }

    return items;
  }
}
