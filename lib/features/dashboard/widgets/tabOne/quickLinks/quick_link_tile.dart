import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuickLinkTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool showInfoIcon;

  const QuickLinkTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.showInfoIcon = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            // Icon left
            CircleAvatar(
              backgroundColor: Colors.green.shade200,
              child: Icon(icon, color: Colors.white),
            ),
            const SizedBox(width: 12),

            // Title + Subtitle + Info icon
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          title,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 10,
                          ),
                        ),
                      ),
                      if (showInfoIcon)
                        Padding(
                          padding: const EdgeInsets.only(left: 6),
                          child: Icon(Icons.info_outline,
                              size: 16, color: Colors.teal),
                        ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
            ),

            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.orange),
          ],
        ),
      ),
    );
  }
}
