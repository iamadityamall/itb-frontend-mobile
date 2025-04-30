import 'package:flutter/material.dart';

class DrawerSectionModel {
  final String title;
  final IconData icon;
  final List<String> children;

  const DrawerSectionModel({
    required this.title,
    required this.icon,
    required this.children,
  });
}
