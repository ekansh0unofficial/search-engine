import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:search_engine/model/item.dart';

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

  Future<List<Item>> searchItem(String search) async {
    List<Item> items = [];

    final baseUrl = 'https://searchengine-app.azurewebsites.net';
    final url = Uri.parse('$baseUrl/search?query=$search&top_k=5');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final decoded = json.decode(response.body);

        if (decoded is List) {
          items = decoded.map<Item>((e) => Item.fromJson(e)).toList();
        } else if (decoded is Map<String, dynamic>) {
          items = [Item.fromJson(decoded)];
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
