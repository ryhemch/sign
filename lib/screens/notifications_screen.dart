import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset('assets/icons/back.png'), // Custom back icon
          onPressed: () => Navigator.pop(context), // Go back to home page
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Notifications',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Image.asset(
                'assets/icons/notif.png'), // Add notif.png to the right
            onPressed: () {}, // Add functionality if needed
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'You have 9 notifications today',
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: const [
                  // Today section
                  Text(
                    'Today',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  NotificationItem(
                    profileImage: 'assets/icons/user1.png',
                    title:
                        'Accident detected on [National Road]. Please drive carefully.',
                    time: '5 minutes ago',
                    isNew: true,
                  ),
                  NotificationItem(
                    profileImage: 'assets/icons/user2.png',
                    title: 'Diversion active: Construction on [Boulevard X].',
                    time: '30 minutes ago',
                    isNew: true,
                  ),
                  NotificationItem(
                    profileImage: 'assets/icons/user3.png',
                    title:
                        'Traffic jam reported in [City Center]. Prepare an alternative route.',
                    time: '2 hours ago',
                    isNew: true,
                  ),
                  SizedBox(height: 20),
                  // Earlier section
                  Text(
                    'Earlier',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  NotificationItem(
                    profileImage: 'assets/icons/user1.png',
                    title: 'Traffic normalized on [Route X].',
                    time: 'Yesterday',
                  ),
                  NotificationItem(
                    profileImage: 'assets/icons/user2.png',
                    title: 'Traffic lights installed at [Intersection Y].',
                    time: '2 days ago',
                  ),
                  NotificationItem(
                    profileImage: 'assets/icons/user3.png',
                    title: 'Speed limit enforced on [Main Avenue].',
                    time: '3 days ago',
                  ),
                  NotificationItem(
                    profileImage: 'assets/icons/user1.png',
                    title: 'High pollution level reported in your area.',
                    time: 'Today, 9:30 AM',
                    isNew: true,
                  ),
                  NotificationItem(
                    profileImage: 'assets/icons/user2.png',
                    title: 'No parking reported on [Street X].',
                    time: 'Today, 8:00 AM',
                    isNew: true,
                  ),
                  NotificationItem(
                    profileImage: 'assets/icons/user3.png',
                    title: 'Rain expected in the coming hours. Drive safely.',
                    time: 'Yesterday, 6:00 PM',
                  ),
                  NotificationItem(
                    profileImage: 'assets/icons/user1.png',
                    title: 'Cameras activated in the area [Intersection Z].',
                    time: '3 hours ago',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  final String profileImage;
  final String title;
  final String time;
  final bool isNew;

  const NotificationItem({
    required this.profileImage,
    required this.title,
    required this.time,
    this.isNew = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          // Profile image
          CircleAvatar(
            backgroundImage: AssetImage(profileImage),
            radius: 25,
          ),
          const SizedBox(width: 10),
          // Notification details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  time,
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          // New notification indicator
          if (isNew)
            const Icon(
              Icons.circle,
              color: Colors.red,
              size: 10,
            ),
        ],
      ),
    );
  }
}
