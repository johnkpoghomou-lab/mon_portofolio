import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  final Map<String, GlobalKey> sectionKeys;
  final Function(GlobalKey) onScroll;

  const MyDrawer({super.key, required this.sectionKeys, required this.onScroll});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // --- GOD DESIGN DRAWER HEADER ---
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.blue.shade900, Colors.blue.shade600],
              ),
            ),
            currentAccountPicture: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 3),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                  )
                ],
              ),
              child: ClipOval(
                child: Image.asset(
                  'assets/images/1.jpg', // Path to your image
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.person, size: 80, color: Colors.white),
                ),
              ),
            ),
            accountName: const Text(
              'John Kpoghomou',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            accountEmail: const Text(
              'Flutter & Web Developer ....codeur6',
              style: TextStyle(color: Colors.white70),
            ),
          ),

          // --- MENU ITEMS ---
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                ...sectionKeys.entries.map((entry) => ListTile(
                  leading: const Icon(Icons.arrow_right_alt, color: Colors.blue),
                  title: Text(
                    entry.key,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    Navigator.pop(context); // Close drawer
                    onScroll(entry.value); // Scroll to section
                  },
                )),
              ],
            ),
          ),

          // Optional: A small footer inside the drawer
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "v1.0.0",
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          )
        ],
      ),
    );
  }
}