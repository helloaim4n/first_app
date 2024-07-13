import 'dart:async';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../providers/app_state.dart';
import '../models/quote_model.dart';
import '../services/api_service.dart';

class ApiPage extends StatefulWidget {
  @override
  State<ApiPage> createState() => _ApiPageState();
}

class _ApiPageState extends State<ApiPage> {
  late Future<Quote> futureQuote;

  @override
  void initState() {
    super.initState();
    final appState = Provider.of<AppState>(context, listen: false);
    futureQuote = ApiService.fetchQuote(appState.currentQuoteIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data from API'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder<Quote>(
              future: futureQuote,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data!.text);
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const CircularProgressIndicator();
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  var appState = context.read<AppState>();
                  appState.getNextQuote();
                  futureQuote =
                      ApiService.fetchQuote(appState.currentQuoteIndex);
                });
              },
              child: Text('Fetch New Quote'),
            ),
          ],
        ),
      ),
    );
  }
}
