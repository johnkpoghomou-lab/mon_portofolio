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

    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 42),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 2)
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
                const Icon(Icons.code, color: Colors.blue, size: 32),
                const SizedBox(width: 10),
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'JOHN',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1A237E), // Navy Blue
                          letterSpacing: 1.2,
                        ),
                      ),
                      TextSpan(
                        text: ' .',
                        style: TextStyle(
                          fontSize: 30,
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
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: TextButton(
                onPressed: () => onScroll(entry.value),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.black87,
                  overlayColor: Colors.blue.withOpacity(0.1),
                ),
                child: Text(
                  entry.key,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            )),

          if (!isMobile) ...[
            const SizedBox(width: 20),
            // ME CONTACTER ACTION BUTTON
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)
                ),
              ),
              onPressed: () => onScroll(sectionKeys['Contact']!),
              child: const Text('Contact'),
            ),
          ],

          // --- MOBILE HAMBURGER ---
          if (isMobile)
            IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: const Icon(Icons.menu, color: Colors.blue, size: 30),
            )
        ],
      ),
    );
  });
}
}