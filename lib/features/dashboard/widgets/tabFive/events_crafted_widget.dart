import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EventsCraftedWidget extends StatelessWidget {
  const EventsCraftedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final events = [
      {'title': 'MONALI\nTHAKUR', 'subtitle': 'TEACHES MUSIC'},
      {'title': 'ARJIT\nSINGH', 'subtitle': 'TEACHES VOCALS'},
      {'title': 'SONU\nNIGAM', 'subtitle': 'VOICE TRAINING'},
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            "Events crafted for you",
            style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),

          // Cards list
          SizedBox(
            height: 160,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: events.length,
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                final event = events[index];

                return Container(
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.deepPurple.shade200,
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      // Info section
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                             Text(
                              "unluclass",
                              style:  GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              event['title'] ?? '',
                              style:  GoogleFonts.poppins(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                height: 1.2,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              event['subtitle'] ?? '',
                              style:  GoogleFonts.poppins(
                                fontSize: 10,
                                letterSpacing: 1.2,
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Container(
                        width: 90,
                        height: 130,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.white.withOpacity(0.4),
                        ),
                        child: const Center(
                          child: Icon(Icons.person, size: 50, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
