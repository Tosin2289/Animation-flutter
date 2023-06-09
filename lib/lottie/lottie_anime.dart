import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class lottieAnime extends StatelessWidget {
  const lottieAnime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset('assets/dart.json'),
      ),
    );
  }
}
