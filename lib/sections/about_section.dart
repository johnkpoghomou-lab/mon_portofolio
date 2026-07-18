import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    bool mobile = MediaQuery.of(context).size.width < 800;

    return Container(
      width: double.infinity,
      // Subtle gradient background to distinguish from other sections
      decoration: BoxDecoration(
        color: Colors.white,
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.white, Colors.blue.shade50.withOpacity(0.3)],
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 80),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Section Title
          const Text(
            'À propos',
            style: TextStyle(
              color: Color(0xFF1A237E),
              fontWeight: FontWeight.bold,
              fontSize: 42,
              letterSpacing: -1,
            ),
          ),
          const SizedBox(height: 10),
          Container(height: 4, width: 50, color: Colors.blue),
          const SizedBox(height: 60),

          Flex(
            direction: mobile ? Axis.vertical : Axis.horizontal,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              // --- IMAGE PART WITH STYLISH BORDER ---
              _buildAboutImage(mobile),

              SizedBox(width: mobile ? 0 : 60),
              SizedBox(height: mobile ? 50 : 0),

              // --- TEXT PART ---
              mobile
                  ? _buildTextContent(mobile)
                  : Expanded(child: _buildTextContent(mobile)),
            ],
          )
        ],
      ),
    ).animate().fadeIn(duration: 800.ms).slideY(begin: 0.1);
  }

  Widget _buildAboutImage(bool mobile) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Decorative background square
        Transform.rotate(
          angle: 0.1,
          child: Container(
            width: 260,
            height: 260,
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
        // Actual Image Container
        Container(
          width: 260,
          height: 260,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 20,
                offset: const Offset(0, 10),
              )
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset(
              'assets/images/1.jpg',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
              const Icon(Icons.person, size: 100, color: Colors.blue),
            ),
          ),
        ),
      ],
    ).animate().scale(delay: 200.ms);
  }

  Widget _buildTextContent(bool mobile) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment:
      mobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          "Qui suis-je ?",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.blue.shade800,
          ),
        ),
        const SizedBox(height: 15),
        Text(
          "Je suis John Kpoghomou, développeur mobile Flutter et web passionné par la création d'applications modernes, performantes et intuitives.",
          style: TextStyle(
            fontSize: 18,
            height: 1.8,
            color: Colors.grey.shade800,
            fontWeight: FontWeight.w500,
          ),
          textAlign: mobile ? TextAlign.center : TextAlign.justify,
        ),
        const SizedBox(height: 15),
        Text(
          "Je conçois des interfaces élégantes et développe des solutions qui répondent aux besoins des utilisateurs, avec Flutter, Firebase et des technologies web.",
          textAlign: mobile ? TextAlign.center : TextAlign.justify,
          style: TextStyle(fontSize: 17, height: 1.8, color: Colors.grey.shade700),
        ),
        const SizedBox(height: 40),

        // --- INFO CARDS GRID ---
        Wrap(
          spacing: 20,
          runSpacing: 20,
          alignment: mobile ? WrapAlignment.center : WrapAlignment.start,
          children: const [
            _InfoCard(
              icon: Icons.school_outlined,
              title: 'Expertise',
              value: 'Développement Flutter',
            ),
            _InfoCard(
              icon: Icons.cloud_done_outlined,
              title: 'Backend',
              value: 'Firebase Services',
            ),
            _InfoCard(
              icon: Icons.palette_outlined,
              title: 'Design',
              value: 'Interfaces Modernes',
            ),
            _InfoCard(
              icon: Icons.rocket_launch_outlined,
              title: 'Projets',
              value: '3+ Applications',
            ),
          ],
        )
      ],
    );
  }
}

class _InfoCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String value;

  const _InfoCard({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  State<_InfoCard> createState() => _InfoCardState();
}

class _InfoCardState extends State<_InfoCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: 300.ms,
        width: 220,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: isHovered ? Colors.blue : Colors.blue.shade50,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            if (isHovered)
              BoxShadow(
                color: Colors.blue.withOpacity(0.3),
                blurRadius: 15,
                offset: const Offset(0, 8),
              )
          ],
        ),
        child: Column(
          children: [
            Icon(
              widget.icon,
              color: isHovered ? Colors.white : Colors.blue,
              size: 35,
            ),
            const SizedBox(height: 15),
            Text(
              widget.title,
              style: TextStyle(
                fontSize: 14,
                color: isHovered ? Colors.white70 : Colors.blueGrey,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              widget.value,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: isHovered ? Colors.white : Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}