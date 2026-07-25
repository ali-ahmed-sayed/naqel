import 'package:flutter/material.dart';

class LegalRow extends StatelessWidget {
  final String label;
  const LegalRow({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
          const Icon(Icons.chevron_right, color: Colors.black38),
        ],
      ),
    );
  }
}
