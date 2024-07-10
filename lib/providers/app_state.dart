import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

// This class represents the state of the app
class AppState extends ChangeNotifier {
  var current = WordPair.random(); // The current word pair

  bool _loggedIn = false; // Flag to indicate if the user is logged in
  int _selectedIndex = 0; // The index of the selected tab in the app

  // Getters for isLoggedIn and selectedIndex
  bool get isLoggedIn => _loggedIn;
  int get selectedIndex => _selectedIndex;

  // Method to log in the user
  void logIn() {
    _loggedIn = true;
    notifyListeners(); // Notify listeners that the state has changed
  }

  // Method to log out the user
  void logOut() {
    _loggedIn = false;
    notifyListeners(); // Notify listeners that the state has changed
  }

  // Method to set the selected tab index
  void setSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners(); // Notify listeners that the state has changed
  }

  // Method to get the next random word pair
  void getNextWord() {
    current = WordPair.random();
    notifyListeners(); // Notify listeners that the state has changed
  }

  var favorites = <WordPair>[]; // List to store favorite word pairs

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
    print('Removed $pair');
    notifyListeners(); // Notify listeners that the state has changed
  }
}
