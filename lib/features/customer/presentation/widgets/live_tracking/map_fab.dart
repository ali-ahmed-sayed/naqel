import 'package:flutter/material.dart';

class MapFab extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const MapFab({super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      shape: const CircleBorder(),
      elevation: 2,
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Icon(icon, color: Colors.black87, size: 20),
        ),
      ),
    );
  }
}
