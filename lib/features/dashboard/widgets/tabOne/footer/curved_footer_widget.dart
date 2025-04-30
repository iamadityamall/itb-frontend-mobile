import 'package:flutter/material.dart';

import 'WaveClipper.dart';

class CurvedFooterWidget extends StatelessWidget {
  const CurvedFooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      width: double.infinity,
      child: Stack(
        children: [
          // Background waves
          Positioned.fill(
            child: ClipPath(
              clipper: WaveClipper(),
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFB2F5EA), Color(0xFF81E6D9)],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  ),
                ),
              ),
            ),
          ),

          // Top wave
          Positioned.fill(
            child: ClipPath(
              clipper: TopWaveClipper(),
              child: Container(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
