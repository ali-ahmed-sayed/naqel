import 'package:flutter/material.dart';
import 'package:naqel/features/splash/presentation/widgets/splash_widgets/brand_header.dart';
import 'package:naqel/features/splash/presentation/widgets/splash_widgets/splash_content.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: .spaceEvenly,
        crossAxisAlignment: .center,
        children: [const BrandHeader(), const SplashContent()],
      ),
    );
  }
}


