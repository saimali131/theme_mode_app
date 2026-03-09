import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final ThemeMode mode;
  final VoidCallback x;
  const ProfileScreen({super.key, required this.mode, required this.x});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: x,

              child: Icon(
                mode == ThemeMode.light ? Icons.light_mode : Icons.dark_mode,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),

            // Profile Image
            CircleAvatar(
              radius: 60,
              backgroundImage: const NetworkImage("https://i.pravatar.cc/300"),
            ),

            const SizedBox(height: 15),

            // Name
            const Text(
              "Saim Ali",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 5),

            // Email
            const Text(
              "saimali@example.com",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),

            const SizedBox(height: 20),

            // Edit Profile Button
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 50,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text("Edit Profile"),
            ),

            const SizedBox(height: 30),

            // Profile Sections
            ProfileItem(icon: Icons.person, title: "Account"),
            ProfileItem(icon: Icons.settings, title: "Settings"),
            ProfileItem(icon: Icons.lock, title: "Privacy"),
            ProfileItem(icon: Icons.help, title: "Help & Support"),
            ProfileItem(
              icon: Icons.logout,
              title: "Logout",
              iconColor: Colors.red,
              textColor: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}

// Reusable Profile Section Widget
class ProfileItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color iconColor;
  final Color textColor;

  const ProfileItem({
    super.key,
    required this.icon,
    required this.title,
    this.iconColor = Colors.blue,
    this.textColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: Icon(icon, color: iconColor),
        title: Text(title, style: TextStyle(color: textColor)),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {},
      ),
    );
  }
}
