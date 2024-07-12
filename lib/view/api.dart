import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import '../models/quote_model.dart';

Future<Quote> fetchQuote() async {
  final response = await http.get(Uri.parse('https://type.fit/api/quotes'));

  if (response.statusCode == 200) {
    final jsonRes = json.decode(response.body);
    return Quote.fromJson(jsonRes[0]);
  } else {
    throw Exception('Failed to fetch data');
  }
}

class ApiPage extends StatefulWidget {
  @override
  State<ApiPage> createState() => _ApiPageState();
}

class _ApiPageState extends State<ApiPage> {
  late Future<Quote> futureQuote;

  @override
  void initState() {
    super.initState();
    futureQuote = fetchQuote();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data from API'),
      ),
      body: Center(
          child: FutureBuilder<Quote>(
              future: futureQuote,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data!.text);
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }

                return const CircularProgressIndicator();
              })),
    );
  }
}
