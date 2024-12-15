import 'package:flutter/material.dart';
import 'screens/splash_screen.dart'; // Assurez-vous que ce fichier existe

void main() => runApp(const MyApp()); // Le point d'entrée de l'application

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Désactive le badge "Debug"
      title: 'SafeSign', // Nom de l'application
      theme: ThemeData(
        primarySwatch: Colors.blue, // Définit le thème global
      ),
      home: const SplashScreen(), // Point de départ de l'application
    );
  }
}
