// Fetch a random quote from the API
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/quote_model.dart';

class ApiService {
  static const String _baseUrl = 'https://type.fit/api/quotes';

  static Future<Quote> fetchQuote(int index) async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        var quote = data[index % data.length];
        return Quote.fromJson(quote);
      } else {
        throw Exception('Failed to load quotes: ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Failed to load quotes: $e');
    }
  }
}
