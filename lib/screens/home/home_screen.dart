import 'package:flutter/material.dart';
import 'package:mon_portofolio/core/widgets/navbar.dart';
import 'package:mon_portofolio/sections/about_section.dart';
import 'package:mon_portofolio/sections/contacts_section.dart';
import 'package:mon_portofolio/sections/footer.dart';
import 'package:mon_portofolio/sections/hero_section.dart';
import 'package:mon_portofolio/sections/projets_section.dart';
import 'package:mon_portofolio/sections/skills_section.dart';

import '../../core/widgets/mydrawer.dart';
import '../../core/widgets/smothly_widg.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  // 1. Create GlobalKeys for every section
  final GlobalKey homeKey = GlobalKey();
  final GlobalKey aboutKey = GlobalKey();
  final GlobalKey skillsKey = GlobalKey();
  final GlobalKey projectsKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();

  // 2. Create a Map to associate names with keys
  late final Map<String, GlobalKey> sectionKeys = {
    'Accueil': homeKey,
    'A propos': aboutKey,
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
      // Pass keys and scroll function to Drawer
      drawer: MyDrawer(sectionKeys: sectionKeys, onScroll: scrollToSection),
      body: Column(
        children: [
          // Pass keys and scroll function to Navbar
          Navbar(sectionKeys: sectionKeys, onScroll: scrollToSection),

          Expanded(
            child: ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(
                scrollbars: true,
                physics: const BouncingScrollPhysics(),//add that smoth bound
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    HeroSection(key: homeKey, projectKey: projectsKey), // Hero usually animates on start

                    SmoothFade(child: About(key: aboutKey)),

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
    );
  }
}
