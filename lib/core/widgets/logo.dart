import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Naqel",
      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
        color: Theme.of(context).primaryColor,
        letterSpacing: -1.2,
      ),
    );
  }
}
