import 'package:flutter/material.dart';
import '../providers/app_state.dart';
import 'package:provider/provider.dart';

class UserProfileSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();

    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile Settings'),
      ),
      body: Row(
        children: [
          ElevatedButton.icon(
              onPressed: () {
                appState.logOut();
                print('User Logged Out');
              },
              icon: Icon(Icons.logout),
              label: Text('Sign Out'))
        ],
      ),
    );
  }
}
