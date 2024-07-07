import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  var current = WordPair.random();

  // Get the next word
  void getNextWord() {
    current = WordPair.random();
    notifyListeners();
  }

  var favorites = <WordPair>[];

  // Toggle the favorite
  void toggleFavorite() {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    notifyListeners();
  }

  // Untoggle the favorite
  void untoggleFavorite(WordPair pair) {
    favorites.remove(pair);
    notifyListeners();
  }
}
