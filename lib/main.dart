import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/app_state.dart';
import 'pages/home.dart';
import 'pages/login.dart';
import 'package:go_router/go_router.dart';
import '../providers/app_routes.dart';

void main() {
  runApp(const MyApp());
}

GoRouter createRouter(AppState appState) {
  return GoRouter(
    initialLocation: AppRoutes.login,
    refreshListenable: appState,
    redirect: (context, state) {
      final loggedIn = appState.isLoggedIn;
      final goingToLogin = state.uri.toString() == AppRoutes.home;

      if (!loggedIn && !goingToLogin) return AppRoutes.login;
      if (loggedIn && goingToLogin) return AppRoutes.home;
      return null;
    },
    routes: [
      GoRoute(
        path: AppRoutes.login,
        redirect: (context, state) =>
            appState.isLoggedIn ? AppRoutes.home : null,
        builder: (context, state) => LoginPage(),
      ),
      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) => HomePage(),
      ),
    ],
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppState(),
      child: Consumer<AppState>(builder: (context, appState, _) {
        return MaterialApp.router(
            color: Theme.of(context).colorScheme.primaryContainer,
            title: 'First App',
            theme: ThemeData(
              useMaterial3: true,
              colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.blue,
                secondary: Colors.red,
              ),
            ),
            routerConfig: createRouter(appState));
      }),
    );
  }
}
