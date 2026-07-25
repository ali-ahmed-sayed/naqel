import 'package:flutter/material.dart';
import 'package:naqel/core/theme/SwiftShip_theme.dart';

class AvatarStack extends StatelessWidget {
  const AvatarStack({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      height: 32,
      child: Stack(
        children: [
          const CircleAvatar(
            radius: 16,
            backgroundColor: Colors.black26,
            backgroundImage: AssetImage("assets/Images/package_sample.jpg"),
          ),
          Positioned(
            left: 28,
            child: CircleAvatar(
              radius: 16,
              backgroundColor: SwiftShipTheme.secondaryButtonFill,
              child: const Text(
                '+2',
                style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
