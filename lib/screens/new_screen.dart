
import 'package:flutter/material.dart';

class ProfileChangeScreen extends StatefulWidget {
  final ThemeMode mode;
  final VoidCallback x;
  const ProfileChangeScreen({super.key, required this.mode, required this.x});

  @override
  State<ProfileChangeScreen> createState() => _ProfileChangeScreenState();
}

class _ProfileChangeScreenState extends State<ProfileChangeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 22.0),
            child: GestureDetector(
              onTap: widget.x,
              child: Icon(
                widget.mode == ThemeMode.dark
                    ? Icons.dark_mode
                    : Icons.light_mode,
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
              backgroundImage: NetworkImage("https://i.pravatar.cc/300"),
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
            ElevatedButton(onPressed: () {}, child: const Text("Edit Profile")),

            const SizedBox(height: 30),

            // Profile Sections
            ProfileTile(icon: Icons.person, title: "Account", onTap: () {}),

            ProfileTile(icon: Icons.settings, title: "Settings", onTap: () {}),

            ProfileTile(icon: Icons.lock, title: "Privacy", onTap: () {}),

            ProfileTile(
              icon: Icons.help,
              title: "Help & Support",
              onTap: () {},
            ),

            ProfileTile(
              icon: Icons.logout,
              title: "Logout",
              iconColor: Colors.red,
              textColor: Colors.red,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

// Reusable ListTile Widget
class ProfileTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final Color iconColor;
  final Color textColor;

  const ProfileTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.iconColor = Colors.blue,
    this.textColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: iconColor),
      title: Text(title, style: TextStyle(color: textColor)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}
