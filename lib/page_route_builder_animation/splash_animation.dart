import 'dart:async';

import 'package:flutter/material.dart';

class SplashAnimation extends StatefulWidget {
  const SplashAnimation({super.key});

  @override
  State<SplashAnimation> createState() => _SplashAnimationState();
}

class _SplashAnimationState extends State<SplashAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleanimation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    controller.addListener(() {
      if (controller.isCompleted) {
        Navigator.of(context).push(PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const Destination();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ));
        Timer(const Duration(milliseconds: 500), () {
          controller.reset();
        });
      }
    });
    scaleanimation = Tween<double>(begin: 1, end: 10).animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            controller.forward();
          },
          child: ScaleTransition(
            scale: scaleanimation,
            child: Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Destination extends StatelessWidget {
  const Destination({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text('Go Back'),
      ),
      body: const Center(child: Text('Go Back')),
    );
  }
}
