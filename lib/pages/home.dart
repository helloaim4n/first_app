import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

import '../pages/generator.dart';
import '../pages/favorites.dart';
import '../pages/settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_state.dart';
import '../pages/api.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();

    return MaterialApp(
      title: 'Bottom Tab Demo',
      home: SafeArea(
        child: PersistentTabView(
          tabs: [
            PersistentTabConfig(
              screen: GeneratorPage(),
              item: ItemConfig(
                icon: Icon(Icons.lightbulb_sharp),
                title: 'Word Generator',
              ),
            ),
            PersistentTabConfig(
              screen: FavoritesPage(),
              item: ItemConfig(
                icon: Icon(Icons.favorite),
                title: 'Favorites',
              ),
            ),
            PersistentTabConfig(
              screen: ApiPage(),
              item: ItemConfig(
                icon: Icon(Icons.api),
                title: 'API',
              ),
            ),
            PersistentTabConfig(
              screen: UserProfileSettingsPage(),
              item: ItemConfig(
                icon: Icon(Icons.settings),
                title: 'Settings',
              ),
            ),
          ],
          navBarBuilder: (navBarConfig) => Style1BottomNavBar(
            navBarConfig: navBarConfig,
          ),
        ),
      ),
    );
  }
}
