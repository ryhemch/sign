import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select a User:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            // Grille des icônes utilisateurs
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // 3 colonnes dans la grille
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: 3, // 3 utilisateurs
                itemBuilder: (context, index) {
                  // Les noms des fichiers d'images utilisateur
                  final List<String> userImages = [
                    'assets/icons/user1.png',
                    'assets/icons/user2.png',
                    'assets/icons/user3.png',
                  ];

                  return GestureDetector(
                    onTap: () {
                      // Action lors du clic sur un utilisateur
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('User ${index + 1} selected!'),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 40, // Taille de l'icône
                          backgroundImage: AssetImage(userImages[index]),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'User ${index + 1}',
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
