import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:rive/rive.dart';

import 'componets/animated_btn.dart';
import 'componets/custom_signin_dialog.dart';
import 'componets/sign_in_form.dart';

class riveAnimeOnboarding extends StatefulWidget {
  const riveAnimeOnboarding({Key? key}) : super(key: key);

  @override
  State<riveAnimeOnboarding> createState() => _riveAnimeOnboardingState();
}

class _riveAnimeOnboardingState extends State<riveAnimeOnboarding> {
  bool isSignInDialogShown = false;
  late RiveAnimationController _btnAnimationController;
  @override
  void initState() {
    _btnAnimationController = OneShotAnimation("active", autoplay: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            width: MediaQuery.of(context).size.width * 1.7,
            bottom: 200,
            left: 100,
            child: Image.asset("assets/background/Spline.png"),
          ),
          Positioned.fill(
              child: BackdropFilter(
            child: SizedBox(),
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          )),
          const RiveAnimation.asset("assets/riveAssets/shapes.riv"),
          Positioned.fill(
              child: BackdropFilter(
            child: SizedBox(),
            filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
          )),
          AnimatedPositioned(
            top: isSignInDialogShown ? -50 : 0,
            duration: const Duration(milliseconds: 240),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spacer(),
                    SizedBox(
                      width: 260,
                      child: Column(
                        children: const [
                          Text(
                            "Learn design & code",
                            style: TextStyle(
                                fontSize: 60,
                                fontFamily: "Poppins",
                                height: 1.2,
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                              "Don't skip designs. Learn design and code by building real apps with flutter and Swfit. Complete courses about the best tools.")
                        ],
                      ),
                    ),
                    Spacer(),
                    AnimatedBtn(
                      btnAnimationController: _btnAnimationController,
                      press: () {
                        _btnAnimationController.isActive = true;

                        Future.delayed(
                          Duration(milliseconds: 800),
                          () {
                            setState(() {
                              isSignInDialogShown = true;
                            });
                            customSignInDialog(context, onClosed: (_) {
                              setState(() {
                                isSignInDialogShown = false;
                              });
                            });
                          },
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24.0),
                      child: Text(
                          "Purchase includes acess to 30+ cources,240+ premimum tutorials,120+ hours of videos,source file and certificates"),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
