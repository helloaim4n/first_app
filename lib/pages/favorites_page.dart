import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_state.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();

    // Show a message if there are no favorites
    if (appState.favorites.isEmpty) {
      return Center(
        child: Text('No favorites yet 🤔'),
      );
    }

    // Show the list of favorites
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('You have ❤️${appState.favorites.length} favorites'),
        ),
        for (var pair in appState.favorites)
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text(pair.asPascalCase),
            onTap: () {
              // Untoggle the favorite
              appState.untoggleFavorite(pair);
            },
          )
      ],
    );
  }
}
