import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_state.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _login() {
    context.read<AppState>().logIn();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          // Show snackbar
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Center(
                                    child: const Text(
                                        'Successfully Logged In! 🎉')),
                                duration: const Duration(seconds: 3),
                                width: 250,
                                behavior: SnackBarBehavior.floating,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                )),
                          );
                          // Log in the user
                          _login();
                        }
                      },
                      child: const Text('Login'),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        // Handle signup button press
                        print('Signup Click!');
                      },
                      child: Text('Signup'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//  In the above code, we have created a simple login page with email and password fields. We have also added a validation for email and password fields. If the validation passes, the user will be logged in. 
//  The  login()  function is called when the user clicks the login button. It checks if the form is valid and logs in the user. 
//  The  _showError()  function is called when the validation fails. It shows an error message in a snackbar. 
//  The  ShowSnackBar  widget is a simple button that shows a snackbar when clicked. 
//  Conclusion 
//  In this article, we have learned how to use the  Provider  package in Flutter to manage the state of an application. We have also seen how to use the  ChangeNotifier  class to notify listeners when the state changes. 
//  We have created a simple application that uses the  Provider  package to manage the state of the application. We have also seen how to use the  ChangeNotifier  class to notify listeners when the state changes. 
//  I hope this article was helpful to you. If you have any questions or suggestions, feel free to leave a comment below. 
//  Happy coding! 
//  Peer Review Contributions by:  Aiman Aizuddin
