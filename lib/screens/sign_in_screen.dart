import 'package:flutter/material.dart';
import 'package:safesign_off/screens/welcomescreen.dart';
import 'package:safesign_off/screens/reset_password_screen.dart'; // Importer ResetPasswordScreen

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  String? usernameErrorMessage; // Message d'erreur pour le username
  String? passwordErrorMessage; // Message d'erreur pour le password

  final String correctUsername = "ryhem"; // Nom d'utilisateur correct
  final String correctPassword = "ryhem"; // Mot de passe correct

  void validateCredentials() {
    setState(() {
      // Validation du nom d'utilisateur
      if (usernameController.text != correctUsername) {
        usernameErrorMessage = "Invalid username!";
      } else {
        usernameErrorMessage = null;
      }

      // Validation du mot de passe
      if (passwordController.text != correctPassword) {
        passwordErrorMessage = "Incorrect password!";
      } else {
        passwordErrorMessage = null;
      }

      // Si tout est correct, naviguer vers l'écran Welcome
      if (usernameErrorMessage == null && passwordErrorMessage == null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const WelcomeScreen(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Image décorative en haut à gauche
          Positioned(
            top: -100,
            left: -100,
            child: Image.asset(
              'assets/images/akasafra.png',
              width: 300,
              height: 300,
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Titre "SafeSign"
                    const Text(
                      'SafeSign',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Image "el3feux" sous SafeSign
                    Image.asset(
                      'assets/images/el3feux.png',
                      height: 150,
                      width: 150,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 40),

                    // Champ encadré pour le nom d'utilisateur
                    TextField(
                      controller: usernameController,
                      decoration: InputDecoration(
                        labelText: 'Username',
                        labelStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Message d'erreur pour le nom d'utilisateur
                    if (usernameErrorMessage != null)
                      Text(
                        usernameErrorMessage!,
                        style: const TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    const SizedBox(height: 20),

                    // Champ encadré pour le mot de passe
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Message d'erreur pour le mot de passe
                    if (passwordErrorMessage != null)
                      Text(
                        passwordErrorMessage!,
                        style: const TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    const SizedBox(height: 20),

                    // Bouton Sign In
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow[700],
                        padding: const EdgeInsets.symmetric(
                          horizontal: 80,
                          vertical: 15,
                        ),
                      ),
                      onPressed:
                          validateCredentials, // Valider les identifiants
                      child: const Text(
                        'Sign In',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    // Lien vers Forgot Password
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ResetPasswordScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        'Forgot your password?',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
