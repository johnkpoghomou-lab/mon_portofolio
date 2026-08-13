import 'dart:ui';
import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {  final Map<String, GlobalKey> sectionKeys;
final Function(GlobalKey) onScroll;

const Navbar({
  super.key,
  required this.sectionKeys,
  required this.onScroll
});

@override
Widget build(BuildContext context) {
  return LayoutBuilder(builder: (context, constraints) {
    bool isMobile = constraints.maxWidth < 750;

    return Center(
      child: Container(
        height: 70,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        constraints: const BoxConstraints(maxWidth: 1200),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.7),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white.withOpacity(0.3), width: 1.5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.03),
                    blurRadius: 20,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  // --- NEW CODING LOGO ---
                  GestureDetector(
                    onTap: () => onScroll(sectionKeys['Accueil']!),
                    child: Row(
                      children: [
                        const Icon(Icons.code, color: Colors.blue, size: 28),
                        const SizedBox(width: 10),
                        RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: 'JOHN',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF1A237E), // Navy Blue
                                  letterSpacing: 1.2,
                                ),
                              ),
                              TextSpan(
                                text: ' .',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue, // The "dot" is blue
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const Spacer(),

                  // --- DESKTOP MENU ---
                  if (!isMobile)
                    ...sectionKeys.entries.map((entry) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: TextButton(
                        onPressed: () => onScroll(entry.value),
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.black87,
                          overlayColor: Colors.blue.withOpacity(0.1),
                        ),
                        child: Text(
                          entry.key,
                          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                        ),
                      ),
                    )),

                  if (!isMobile) ...[
                    const SizedBox(width: 10),
                    // ME CONTACTER ACTION BUTTON
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)
                        ),
                      ),
                      onPressed: () => onScroll(sectionKeys['Contact']!),
                      child: const Text('Contact', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                    ),
                  ],

                  // --- MOBILE HAMBURGER ---
                  if (isMobile)
                    IconButton(
                      onPressed: () => Scaffold.of(context).openDrawer(),
                      icon: const Icon(Icons.menu, color: Colors.blue, size: 28),
                    )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  });
}
}