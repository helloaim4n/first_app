import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  var current = WordPair.random();
  var favorites = <WordPair>[];

  bool loggedIn = false;
  bool get isLoggedIn => loggedIn;

  int currentQuoteIndex = 0;

  void getNextQuote() {
    currentQuoteIndex++;
    notifyListeners();
  }

  // Method to log in the user
  void logIn() {
    loggedIn = true;
    notifyListeners(); // Notify listeners that the state has changed
  }

  // Method to log out the user
  void logOut() {
    loggedIn = false;
    notifyListeners(); // Notify listeners that the state has changed
  }

  // Method to get the next random word pair
  void getNextWord() {
    current = WordPair.random();
    notifyListeners(); // Notify listeners that the state has changed
  }

  // Method to toggle the favorite status of the current word pair
  void toggleFavorite() {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    notifyListeners(); // Notify listeners that the state has changed
  }

  // Method to remove a favorite word pair
  void removeFavorite(WordPair pair) {
    favorites.remove(pair);
    notifyListeners(); // Notify listeners that the state has changed
  }
}
