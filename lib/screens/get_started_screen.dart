import 'package:flutter/material.dart';
import 'sign_in_screen.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Image décorative en haut à gauche
          Positioned(
            top: -100, // Ajustez pour déplacer l'image vers le haut
            left: -100, // Ajustez pour déplacer l'image vers la gauche
            child: Image.asset(
              'assets/images/akasafra.png', // Chemin de votre image
              width: 300, // Largeur de l'image
              height: 300, // Hauteur de l'image
            ),
          ),

          // Contenu principal centré
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Titre "SafeSign"
                const Text(
                  'SafeSign',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(
                    height:
                        40), // Espacement entre le titre et l'image principale

                // Image principale (feux)
                Image.asset(
                  'assets/images/feux.png', // Chemin de l'image principale
                  height: 300,
                  width: 200,
                  fit: BoxFit.cover,
                ),

                const SizedBox(
                    height: 40), // Espacement entre l'image et le bouton

                // Bouton "Let's Get Started"
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow[700],
                    padding: const EdgeInsets.symmetric(
                        horizontal: 80, vertical: 15),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignInScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    "Let's Get Started",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
