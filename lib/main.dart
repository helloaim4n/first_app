import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/app_state.dart';
import 'view/home_page.dart';
import 'view/login.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => AppState(),
    child: Consumer<AppState>(builder: (context, appState, _) {
      return MaterialApp(
        color: Theme.of(context).colorScheme.primary,
        title: 'First App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blue,
            secondary: Colors.red,
          ),
        ),
        home: appState.isLoggedIn ? HomePage() : LoginPage(),
      );
    }),
  ));
}
