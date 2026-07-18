import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart'; // Import this

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  // Helper function to launch URLs
  Future<void> _launchURL(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      child: Column(
        children: [
          const Text(
            "Contactez-moi",
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Container(height: 4, width: 60, color: Colors.blue),
          const SizedBox(height: 50),

          Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: [
              _ContactCard(
                icon: Icons.email,
                title: "Email",
                value: "johnkpoghomou@gmail.com",
                onTap: () => _launchURL("mailto:johnkpoghomou@gmail.com"),
              ),
              _ContactCard(
                icon: Icons.phone,
                title: "Téléphone",
                value: "+224 626 66 13 14",
                onTap: () => _launchURL("tel:+224626661314"),
              ),
              _ContactCard(
                icon: Icons.code,
                title: "GitHub",
                value: "Voir mes projets",
                onTap: () => _launchURL("https://johnkpoghomou-lab.github.io/monSiteTailwind-css"),
              ),
              _ContactCard(
                icon: Icons.chat, // WhatsApp Style
                title: "WhatsApp",
                value: "Discuter en direct",
                color: Colors.green, // WhatsApp Green
                onTap: () => _launchURL("https://wa.me/224626661314"),
              ),
            ],
          ),

          const SizedBox(height: 60),

          // Main Call to Action
          ElevatedButton.icon(
            onPressed: () => _launchURL("mailto:johnkpoghomou@gmail.com"),
            icon: const Icon(Icons.send),
            label: const Text("Envoyer un message"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              elevation: 5,
            ),
          ).animate(onPlay: (controller) => controller.repeat(reverse: true))
              .scale(begin: const Offset(1, 1), end: const Offset(1.05, 1.05), duration: 1000.ms),
        ],
      ),
    ).animate().fadeIn(duration: 800.ms);
  }
}

// Improved Card Widget with Hover Effects
class _ContactCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String value;
  final VoidCallback onTap;
  final Color color;

  const _ContactCard({
    required this.icon,
    required this.title,
    required this.value,
    required this.onTap,
    this.color = Colors.blue,
  });

  @override
  State<_ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<_ContactCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: 300.ms,
          width: 240,
          height: 150,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isHovered ? widget.color : Colors.transparent,
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: isHovered ? widget.color.withOpacity(0.2) : Colors.black.withOpacity(0.05),
                blurRadius: 20,
                offset: const Offset(0, 10),
              )
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: widget.color.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(widget.icon, size: 30, color: widget.color),
              ),
              const SizedBox(height: 15),
              Text(
                widget.title,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  widget.value,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}