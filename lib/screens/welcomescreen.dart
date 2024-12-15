import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'notifications_screen.dart';
import 'profile_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  WelcomeScreenState createState() => WelcomeScreenState();
}

class WelcomeScreenState extends State<WelcomeScreen> {
  int _currentIndex = 0;

  // List of screens corresponding to the tabs
  final List<Widget> _screens = [
    const HomeScreen(),
    const NotificationsScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex], // Displays the selected screen
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/icons/home.png'),
              size: 30,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/icons/notif.png'),
              size: 30,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/icons/user.png'),
              size: 30,
            ),
            label: '',
          ),
        ],
        selectedItemColor: Colors.black, // Color of the selected icon
        backgroundColor: Colors.white, // Background color of the bar
      ),
    );
  }
}
