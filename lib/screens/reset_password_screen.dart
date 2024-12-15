import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final newPasswordController = TextEditingController();
  final verifyPasswordController = TextEditingController();

  String? errorMessage;

  void resetPassword() {
    setState(() {
      if (newPasswordController.text.isEmpty ||
          verifyPasswordController.text.isEmpty) {
        errorMessage = "Please fill in all fields!";
      } else if (newPasswordController.text != verifyPasswordController.text) {
        errorMessage = "Passwords do not match!";
      } else {
        errorMessage = null;
        // Logique de réinitialisation (API ou stockage local)
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Password reset successfully!")),
        );
        Navigator.pop(context); // Retour à l'écran précédent
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset(
            'assets/icons/back.png', // Image pour le bouton de retour
            height: 24,
            width: 24,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Reset your password',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
            // Champ "New password"
            TextField(
              controller: newPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'New password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Champ "Verify password"
            TextField(
              controller: verifyPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Verify password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Message d'erreur
            if (errorMessage != null)
              Text(
                errorMessage!,
                style: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            const SizedBox(height: 20),
            // Bouton Reset
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow[700],
                padding: const EdgeInsets.symmetric(
                  horizontal: 80,
                  vertical: 15,
                ),
              ),
              onPressed: resetPassword,
              child: const Text(
                'Reset',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
