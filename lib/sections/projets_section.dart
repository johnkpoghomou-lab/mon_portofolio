import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  final List<Map<String, dynamic>> projects = const [
    {
      "title": "BizGuinée",
      "description": "Système complet de gestion commerciale optimisé pour le marché Guinéen.",
      "tech": ["Flutter", "Firebase", "Hive"],
      "image": "assets/images/bizguinee.png",
    },
    {
      "title": "NoteApp",
      "description": "Prise de notes sécurisée avec interface minimaliste et synchronisation locale.",
      "tech": ["Flutter", "Hive", "Quill"],
      "image": "assets/images/noteapp.jpg",
    },
    {
      "title": "Chorale App",
      "description": "Répertoire numérique de chants et gestion des partitions liturgiques.",
      "tech": ["Flutter", "Firebase"],
      "image": "assets/images/chorale.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 90),
      child: Column(
        children: [
          // Section Title Design
          const Text(
            "Portfolio de Projets",
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
          const SizedBox(height: 20),
          const Text(
            "Découvrez mes réalisations les plus récentes",
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
          const SizedBox(height: 60),

          LayoutBuilder(
            builder: (context, constraints) {
              int count = constraints.maxWidth > 1000 ? 3 : (constraints.maxWidth > 700 ? 2 : 1);

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: count,
                  crossAxisSpacing: 30,
                  mainAxisSpacing: 40,
                  childAspectRatio: 0.82, // Balanced for screenshots
                ),
                itemCount: projects.length,
                itemBuilder: (context, index) {
                  return _ProjectCard(project: projects[index]);
                },
              );
            },
          ),
        ],
      ),
    ).animate().fadeIn(duration: 800.ms).slideY(begin: 0.1);
  }
}

class _ProjectCard extends StatefulWidget {
  final Map<String, dynamic> project;
  const _ProjectCard({required this.project});

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: 300.ms,
        curve: Curves.easeOutCubic,
        transform: isHovered ? (Matrix4.identity()..translate(0, -10, 0)) : Matrix4.identity(),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: isHovered ? Colors.blue.withOpacity(0.2) : Colors.black.withOpacity(0.06),
              blurRadius: isHovered ? 40 : 20,
              offset: const Offset(0, 15),
            )
          ],
        ),
        child: Column(
          children: [
            // --- IMAGE SECTION ---
            Expanded(
              flex: 6,
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: AnimatedScale(
                        scale: isHovered ? 1.15 : 1.0,
                        duration: 800.ms,
                        curve: Curves.easeOut,
                        child: Image.asset(
                          widget.project["image"],
                          fit: BoxFit.cover,
                          errorBuilder: (c, e, s) => Container(
                            color: Colors.blue.shade50,
                            child: const Icon(Icons.image, size: 50, color: Colors.blue),
                          ),
                        ),
                      ),
                    ),
                    // Glassmorphism Overlay on Hover
                    AnimatedOpacity(
                      opacity: isHovered ? 1.0 : 0.0,
                      duration: 300.ms,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.blue.withOpacity(0.4),
                              Colors.black.withOpacity(0.7),
                            ],
                          ),
                        ),
                        child: Center(
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.blue,
                              shape: const StadiumBorder(),
                              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                            ),
                            child: const Text("Détails du projet", style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // --- INFO SECTION ---
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.project["title"],
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF212121),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.project["description"],
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.grey.shade600, fontSize: 15, height: 1.5),
                    ),
                    const Spacer(),
                    // Tech Tags List
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: (widget.project["tech"] as List<String>).map((t) {
                        return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade50,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.blue.withOpacity(0.1)),
                          ),
                          child: Text(
                            t,
                            style: const TextStyle(
                              color: Colors.blue,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}