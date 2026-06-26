import 'package:flutter/material.dart';

class BrandHeader extends StatelessWidget {
  const BrandHeader();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("assets/Brand/Logo.png", width: 128),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Switch",
                style: Theme.of(context).textTheme.displayLarge,
              ),
              TextSpan(text: " ", style: TextStyle(fontSize: 4)),
              TextSpan(
                text: "Ship",
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16),
        Text(
          "THE KINETIC CURATOR",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Color(0xFF737688),
            letterSpacing: 3.2,
          ),
        ),
      ],
    );
  }
}
