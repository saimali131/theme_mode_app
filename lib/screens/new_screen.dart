import 'package:flutter/material.dart';

class ProfileChangeScreen extends StatefulWidget {
  final ThemeMode mode;
  final VoidCallback x;
  const ProfileChangeScreen({super.key, required this.mode, required this.x});

  @override
  State<ProfileChangeScreen> createState() => _ProfileChangeScreenState();
}

class _ProfileChangeScreenState extends State<ProfileChangeScreen> {
  static const Color primary = Color(0xFF6C63FF);
  static const Color primaryDark = Color(0xFF4B41E0);

  @override
  Widget build(BuildContext context) {
    final bool isDark = widget.mode == ThemeMode.dark;
    final Color cardColor = isDark ? const Color(0xFF1E1F26) : Colors.white;
    final Color bgColor = isDark
        ? const Color(0xFF121218)
        : const Color(0xFFF7F8FC);
    final Color textColor = isDark ? Colors.white : const Color(0xFF1E1F26);
    final Color subTextColor = isDark
        ? Colors.grey.shade400
        : Colors.grey.shade600;

    return Scaffold(
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            _buildHeader(context, isDark),
            Transform.translate(
              offset: const Offset(0, -55),
              child: Column(
                children: [
                  // Profile picture with a soft ring + shadow
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: bgColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.12),
                          blurRadius: 16,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: const CircleAvatar(
                      radius: 55,
                      backgroundImage: NetworkImage(
                        "https://i.pravatar.cc/300",
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    "Emily Carter",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "emily.carter@example.com",
                    style: TextStyle(fontSize: 13.5, color: subTextColor),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.edit_outlined, size: 18),
                    label: const Text("Edit Profile"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primary,
                      foregroundColor: Colors.white,
                      elevation: 4,
                      shadowColor: primary.withOpacity(0.4),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 26,
                        vertical: 13,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  const SizedBox(height: 28),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: _sectionCard(
                      cardColor: cardColor,
                      textColor: textColor,
                      children: [
                        ProfileTile(
                          icon: Icons.person_outline_rounded,
                          title: "Account",
                          onTap: () {},
                          textColor: textColor,
                        ),
                        _divider(isDark),
                        ProfileTile(
                          icon: Icons.settings_outlined,
                          title: "Settings",
                          onTap: () {},
                          textColor: textColor,
                        ),
                        _divider(isDark),
                        ProfileTile(
                          icon: Icons.lock_outline_rounded,
                          title: "Privacy",
                          onTap: () {},
                          textColor: textColor,
                        ),
                        _divider(isDark),
                        ProfileTile(
                          icon: Icons.help_outline_rounded,
                          title: "Help & Support",
                          onTap: () {},
                          textColor: textColor,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: _sectionCard(
                      cardColor: cardColor,
                      textColor: textColor,
                      children: [
                        ProfileTile(
                          icon: Icons.logout_rounded,
                          title: "Logout",
                          iconColor: Colors.redAccent,
                          textColor: Colors.redAccent,
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, bool isDark) {
    return Container(
      height: 190,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [primary, primaryDark],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(36),
          bottomRight: Radius.circular(36),
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Profile",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: widget.x,
                child: Container(
                  height: 38,
                  width: 38,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.18),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    isDark ? Icons.dark_mode_rounded : Icons.light_mode_rounded,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sectionCard({
    required Color cardColor,
    required Color textColor,
    required List<Widget> children,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(children: children),
    );
  }

  Widget _divider(bool isDark) {
    return Divider(
      height: 1,
      thickness: 1,
      indent: 56,
      color: isDark ? Colors.white10 : Colors.black.withOpacity(0.05),
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
    this.iconColor = const Color(0xFF6C63FF),
    this.textColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Container(
              height: 36,
              width: 36,
              decoration: BoxDecoration(
                color: iconColor.withOpacity(0.12),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: iconColor, size: 19),
            ),
            title: Text(
              title,
              style: TextStyle(
                color: textColor,
                fontSize: 15.5,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              size: 14,
              color: textColor.withOpacity(0.4),
            ),
            onTap: onTap,
          ),
        ),
      ),
    );
  }
}
