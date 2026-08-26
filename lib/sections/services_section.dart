import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  final List<Map<String, dynamic>> services = const [
    {
      "title": "Mobile App Development",
      "description": "Création d'applications performantes pour iOS et Android avec Flutter. Solutions natives et multiplateformes.",
      "icon": Icons.phone_iphone_rounded,
      "color": Colors.blue,
    },
    {
      "title": "Web Development",
      "description": "Sites web modernes, réactifs et optimisés pour le SEO. Expertise en Flutter Web et Tailwind CSS.",
      "icon": Icons.language_rounded,
      "color": Colors.cyan,
    },
    {
      "title": "UI/UX & Consulting",
      "description": "Conception d'interfaces intuitives et conseils stratégiques pour vos projets digitaux.",
      "icon": Icons.auto_awesome_mosaic_rounded,
      "color": Colors.indigo,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 90),
      child: Column(
        children: [
          const Text(
            "Mes Services",
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.w900,
              color: Color(0xFF1A237E),
              letterSpacing: -1,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: 5,
            width: 80,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(height: 60),
          LayoutBuilder(
            builder: (context, constraints) {
              int count = constraints.maxWidth > 900 ? 3 : 1;
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: count,
                  crossAxisSpacing: 30,
                  mainAxisSpacing: 30,
                  childAspectRatio: constraints.maxWidth > 900 ? 1.1 : 2.0,
                ),
                itemCount: services.length,
                itemBuilder: (context, index) {
                  return _ServiceCard(service: services[index]);
                },
              );
            },
          ),
        ],
      ),
    ).animate().fadeIn(duration: 800.ms).slideY(begin: 0.1);
  }
}

class _ServiceCard extends StatefulWidget {
  final Map<String, dynamic> service;
  const _ServiceCard({required this.service});

  @override
  State<_ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<_ServiceCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: 300.ms,
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.8),
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: isHovered ? widget.service["color"].withOpacity(0.5) : Colors.white.withOpacity(0.5),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: isHovered ? widget.service["color"].withOpacity(0.15) : Colors.black.withOpacity(0.04),
              blurRadius: isHovered ? 40 : 20,
              offset: const Offset(0, 15),
            )
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  widget.service["icon"],
                  size: 50,
                  color: widget.service["color"],
                ).animate(target: isHovered ? 1 : 0).scale(end: const Offset(1.2, 1.2)),
                const SizedBox(height: 20),
                Text(
                  widget.service["title"],
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A237E),
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  widget.service["description"],
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey.shade700,
                    height: 1.6,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
