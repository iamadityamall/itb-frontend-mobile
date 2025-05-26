import 'package:flutter/material.dart';

class CreateMpinAppBackground extends StatelessWidget {
  final Widget child;

  const CreateMpinAppBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF4f46e5), Color(0xFF22c55e)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: child,
    );
  }
}
