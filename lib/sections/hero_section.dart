import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';

class HeroSection extends StatelessWidget {
  final GlobalKey projectKey; // Key passed from HomeScreen to find the ProjectsSection

  const HeroSection({super.key, required this.projectKey});

  // --- ACTION: SCROLL TO PROJECTS ---
  void _scrollToProjects() {
    final context = projectKey.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  // --- ACTION: OPEN GOOGLE DRIVE CV ---
  Future<void> _openCV() async {
    // REPLACE THIS URL WITH YOUR COPIED GOOGLE DRIVE LINK
    final Uri url = Uri.parse(
        "https://drive.google.com/file/d/1G6PbE4XOGgrESsaaJYHYZofhNX6FQwsj/view?usp=drivesdk");

    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      debugPrint("Could not launch CV link");
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 800;

        return Container(
          width: double.infinity,
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height * 0.8,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 60),
          child: Flex(
            direction: isMobile ? Axis.vertical : Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // --- LEFT SIDE: TEXT CONTENT ---
              Expanded(
                flex: isMobile ? 0 : 1,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
                  children: [
                    _buildIntroBadge(),
                    const SizedBox(height: 20),
                    _buildMainTitle(),
                    _buildSubtitle(),
                    const SizedBox(height: 25),
                    _buildDescription(isMobile),
                    const SizedBox(height: 40),
                    _buildActionButtons(isMobile),
                  ],
                ),
              ),

              if (!isMobile) const SizedBox(width: 80) else const SizedBox(height: 60),

              // --- RIGHT SIDE: PROFILE IMAGE ---
              _buildAnimatedProfileImage(isMobile),
            ],
          ),
        );
      },
    );
  }

  // --- UI COMPONENTS (God Design Style) ---

  Widget _buildIntroBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(30),
      ),
      child: const Text(
        '👋 Bonjour, je suis',
        style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 14),
      ),
    ).animate().fadeIn().slideX(begin: -0.2);
  }

  Widget _buildMainTitle() {
    return const Text(
      'John Kpoghomou',
      style: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.bold,
        color: Color(0xFF0D47A1), // Deep Professional Blue
        letterSpacing: -1,
      ),
    ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.2);
  }

  Widget _buildSubtitle() {
    return Text(
      'Flutter & Web Developer',
      style: TextStyle(
        fontSize: 26,
        color: Colors.blue.shade400,
        fontWeight: FontWeight.w600,
      ),
    ).animate().fadeIn(delay: 400.ms);
  }

  Widget _buildDescription(bool isMobile) {
    return SizedBox(
      width: 500,
      child: Text(
        'Je développe des applications modernes, rapides et adaptées aux besoins des utilisateurs.',
        textAlign: isMobile ? TextAlign.center : TextAlign.left,
        style: TextStyle(fontSize: 18, color: Colors.grey.shade700, height: 1.6),
      ),
    ).animate().fadeIn(delay: 600.ms);
  }

  Widget _buildActionButtons(bool isMobile) {
    return Wrap(
      spacing: 20,
      runSpacing: 15,
      alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
      children: [
        // BTN: MES PROJETS
        ElevatedButton(
          onPressed: _scrollToProjects,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 22),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            elevation: 10,
            shadowColor: Colors.blue.withOpacity(0.4),
          ).copyWith(
            // This adds a smooth scale effect on hover automatically on Web/Desktop
            mouseCursor: MaterialStateProperty.all(SystemMouseCursors.click),
          ),
          child: const Text('Mes projets', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        ).animate(onPlay: (c) => c.repeat(reverse: true))
            .shimmer(delay: 3.seconds, duration: 1500.ms),

        // BTN: TELECHARGER CV
        OutlinedButton.icon(
          onPressed: _openCV,
          icon: const Icon(Icons.download_for_offline_rounded),
          label: const Text('Télécharger CV', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 22),
            side: const BorderSide(color: Colors.blue, width: 2),
            foregroundColor: Colors.blue,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          ),
        ),
      ],
    ).animate().fadeIn(delay: 800.ms).slideY(begin: 0.3);
  }

  Widget _buildAnimatedProfileImage(bool isMobile) {
    double size = isMobile ? 240 : 350;
    return Stack(
      alignment: Alignment.center,
      children: [
        // Decorative pulsing ring
        Container(
          width: size + 20,
          height: size + 20,
          decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.blue.withOpacity(0.2), width: 2)),
        ).animate(onPlay: (c) => c.repeat()).scale(duration: 2.seconds, begin: const Offset(1,1), end: const Offset(1.2, 1.2)).fadeOut(),

        // The Photo
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 8),
            boxShadow: [
              BoxShadow(color: Colors.blue.withOpacity(0.2), blurRadius: 40, spreadRadius: 10)
            ],
          ),
          child: ClipOval(
            child: Image.asset(
              'assets/images/1.jpg',
              fit: BoxFit.cover,
              errorBuilder: (c, e, s) => const Icon(Icons.person, size: 100, color: Colors.blue),
            ),
          ),
        ),
      ],
    ).animate().fadeIn(duration: 1.seconds).scale();
  }
}