import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SkillsSection extends StatelessWidget {
  SkillsSection({super.key});

  final List<Map<String, dynamic>> skills = [
    const {"name": "Flutter", "icon": Icons.flutter_dash, "color": Colors.blue},
    const {"name": "Firebase", "icon": Icons.local_fire_department, "color": Colors.orange},
    const {"name": "Hive", "icon": Icons.inventory_2, "color": Colors.yellow},
    // Tailwind specific styling
    const {"name": "Tailwind CSS", "icon": Icons.waves, "color": Colors.cyan},
    const {"name": "HTML / CSS", "icon": Icons.html, "color": Colors.orangeAccent},
    const {"name": "Git & GitHub", "icon": Icons.terminal, "color": Colors.black},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 60),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Mes compétences",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Container(height: 4, width: 60, color: Colors.blue), // Underline
          const SizedBox(height: 50),
          LayoutBuilder(
            builder: (context, constraints) {
              int count = constraints.maxWidth < 600 ? 2 : (constraints.maxWidth < 900 ? 3 : 4);

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: count,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: constraints.maxWidth < 500 ? 1.0 : 1.3,
                ),
                itemCount: skills.length,
                itemBuilder: (context, index) {
                  return _SkillCard(
                    name: skills[index]["name"],
                    icon: skills[index]["icon"],
                    iconColor: skills[index]["color"],
                  );
                },
              );
            },
          ),
        ],
      ),
    ).animate().fadeIn(duration: 800.ms);
  }
}

class _SkillCard extends StatefulWidget {
  final String name;
  final IconData icon;
  final Color iconColor;

  const _SkillCard({required this.name, required this.icon, required this.iconColor});

  @override
  State<_SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<_SkillCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: 300.ms,
        decoration: BoxDecoration(
          color: isHovered ? Colors.white : Colors.white.withOpacity(0.5),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: isHovered ? widget.iconColor.withOpacity(0.2) : Colors.black.withOpacity(0.03),
              blurRadius: isHovered ? 25 : 10,
              offset: isHovered ? const Offset(0, 10) : const Offset(0, 5),
            )
          ],
          border: Border.all(
            color: isHovered ? widget.iconColor.withOpacity(0.5) : Colors.white.withOpacity(0.3),
            width: 1.5,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(widget.icon, size: 45, color: widget.iconColor)
                    .animate(target: isHovered ? 1 : 0)
                    .scale(end: const Offset(1.15, 1.15)),
                const SizedBox(height: 15),
                Text(
                  widget.name,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: isHovered ? Colors.black87 : Colors.black54,
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