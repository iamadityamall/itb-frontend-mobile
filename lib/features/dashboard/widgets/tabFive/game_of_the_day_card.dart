import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GameOfTheDayCard extends StatelessWidget {
  const GameOfTheDayCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            "Game of the day",
            style:  GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              gradient: const LinearGradient(
                colors: [Color(0xFF001F3F), Color(0xFF003366)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                 Text(
                  "IDBI Games",
                  style:  GoogleFonts.poppins(color: Colors.white70, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple.shade700,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child:  Text(
                    "THIS IPL SEASON",
                    style:  GoogleFonts.poppins(color: Colors.white, fontSize: 10),
                  ),
                ),
                const SizedBox(height: 12),
                 Text(
                  "Spin The Wheel &\nGET CASHBACK\nUPTO ₹100",
                  textAlign: TextAlign.center,
                  style:  GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                // Wheel Placeholder
                Container(
                  width: 140,
                  height: 140,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const RadialGradient(
                      colors: [Colors.white, Colors.grey],
                    ),
                    border: Border.all(color: Colors.orange, width: 8),
                  ),
                  child:  Center(
                    child: Text(
                      "🎯\nSpin Wheel",
                      textAlign: TextAlign.center,
                      style:  GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  ),
                  child:  Text("PLAY NOW", style:  GoogleFonts.poppins(fontSize: 10, color: Colors.white)),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
