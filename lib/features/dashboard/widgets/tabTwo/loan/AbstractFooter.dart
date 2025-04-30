import 'package:flutter/material.dart';

class AbstractFooter extends StatelessWidget {
  const AbstractFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFB2F2BB), Color(0xFF80DEEA)],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.elliptical(160, 80),
          topRight: Radius.elliptical(240, 120),
        ),
      ),
    );
  }
}
