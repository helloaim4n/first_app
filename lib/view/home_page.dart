import 'package:flutter/material.dart';
import 'generator_page.dart';
import 'favorites_page.dart';
import 'api_page.dart';
import 'settings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = <Widget>[
    GeneratorPage(),
    FavoritesPage(),
    ApiPage(),
    UserProfileSettingsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<BottomNavigationBarItem> _buildBottomNavBarItems() {
    return const [
      BottomNavigationBarItem(
        icon: Icon(Icons.lightbulb_sharp),
        label: 'Generator',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.favorite),
        label: 'Favorites',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.api),
        label: 'Fetching API',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.settings),
        label: 'Settings',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: _buildBottomNavBarItems(),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.amber[800],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
