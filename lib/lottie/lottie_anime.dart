import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieAnime extends StatelessWidget {
  const LottieAnime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset('assets/dance.json'),
      ),
    );
  }
}
