import 'package:flutter/material.dart';
import 'package:mon_portofolio/core/widgets/background_blobs.dart';
import 'package:mon_portofolio/core/widgets/navbar.dart';
import 'package:mon_portofolio/sections/about_section.dart';
import 'package:mon_portofolio/sections/contacts_section.dart';
import 'package:mon_portofolio/sections/footer.dart';
import 'package:mon_portofolio/sections/hero_section.dart';
import 'package:mon_portofolio/sections/projets_section.dart';
import 'package:mon_portofolio/sections/services_section.dart';
import 'package:mon_portofolio/sections/skills_section.dart';

import '../../core/widgets/mydrawer.dart';
import '../../core/widgets/smothly_widg.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  // 1. Create GlobalKeys for every section
  final GlobalKey homeKey = GlobalKey();
  final GlobalKey aboutKey = GlobalKey();
  final GlobalKey servicesKey = GlobalKey();
  final GlobalKey skillsKey = GlobalKey();
  final GlobalKey projectsKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();

  // 2. Create a Map to associate names with keys
  late final Map<String, GlobalKey> sectionKeys = {
    'Accueil': homeKey,
    'A propos': aboutKey,
    'Services': servicesKey,
    'Compétences': skillsKey,
    'Projects': projectsKey,
    'Contact': contactKey,
  };

  // 3. The scrolling function
  void scrollToSection(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(sectionKeys: sectionKeys, onScroll: scrollToSection),
      body: Stack(
        children: [
          // 1. Background Layer
          const BackgroundDecorations(),

          // 2. Scrollable Content Layer
          Column(
            children: [
              Expanded(
                child: ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context).copyWith(
                    scrollbars: true,
                    physics: const BouncingScrollPhysics(),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // Space for floating Navbar
                        const SizedBox(height: 100),

                        HeroSection(key: homeKey, projectKey: projectsKey),

                        SmoothFade(child: About(key: aboutKey)),

                        SmoothFade(child: ServicesSection(key: servicesKey)),

                        SmoothFade(child: SkillsSection(key: skillsKey)),

                        SmoothFade(child: ProjectsSection(key: projectsKey)),

                        SmoothFade(child: ContactSection(key: contactKey)),

                        const AppFooter(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          // 3. Floating Navbar Layer
          Positioned(
            top: 20,
            left: 0,
            right: 0,
            child: Navbar(sectionKeys: sectionKeys, onScroll: scrollToSection),
          ),
        ],
      ),
    );
  }
}
