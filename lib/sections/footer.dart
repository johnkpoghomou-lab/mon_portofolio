import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  Future<void> _launchURL(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url)) {
      debugPrint("Could not launch $url");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 25),
      decoration: const BoxDecoration(
        color: Color(0xFF0A192F), // Deep Tech Navy
        border: Border(
          top: BorderSide(color: Colors.blueAccent, width: 2),
        ),
      ),
      child: Column(
        children: [
          // LOGO / NAME
          const Text(
            "JOHN KPOGHOMOU",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "Développeur Mobile & Web passionné par l'innovation.",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey.shade400, fontSize: 14),
          ),
          const SizedBox(height: 30),

          // SOCIAL LINKS
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _socialIcon(
                icon: Icons.code,
                onTap: () => _launchURL("https://github.com/johnkpoghomou-lab"),
              ),
              _socialIcon(
                icon: Icons.chat, // WhatsApp
                onTap: () => _launchURL("https://wa.me/224626661314"),
              ),
              _socialIcon(
                icon: Icons.email,
                onTap: () => _launchURL("mailto:johnkpoghomou@gmail.com"),
              ),
            ],
          ),
          const SizedBox(height: 40),

          // DIVIDER
          Divider(color: Colors.white.withOpacity(0.1), thickness: 1),
          const SizedBox(height: 20),

          // COPYRIGHT
          Text(
            "© ${DateTime.now().year} ==>codeur6. Tous droits réservés.",
            style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Fait avec ", style: TextStyle(color: Colors.white70, fontSize: 12)),
              const Icon(Icons.favorite, color: Colors.red, size: 14),
              const Text(" et ", style: TextStyle(color: Colors.white70, fontSize: 12)),
              const Text("Flutter", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _socialIcon({required IconData icon, required VoidCallback onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(50),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white.withOpacity(0.05),
            border: Border.all(color: Colors.white.withOpacity(0.1)),
          ),
          child: Icon(icon, color: Colors.blueAccent, size: 24),
        ),
      ),
    );
  }
}