import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AnimatedScreen extends StatelessWidget {
  const AnimatedScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset('assets/animation.json'), // Replace with your Lottie file
      ),
    );
  }
}
