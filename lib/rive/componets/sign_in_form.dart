import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rive/rive.dart';

class signinForm extends StatefulWidget {
  const signinForm({
    super.key,
  });

  @override
  State<signinForm> createState() => _signinFormState();
}

class _signinFormState extends State<signinForm> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool isLoadingAnimation = false;
  bool isShowConffeti = false;
  late SMITrigger check;
  late SMITrigger error;
  late SMITrigger reset;
  late SMITrigger confetti;
  StateMachineController getRiveContoller(Artboard artboard) {
    StateMachineController? controller =
        StateMachineController.fromArtboard(artboard, "State Machine 1");
    artboard.addController(controller!);
    return controller;
  }

  void signIn(BuildContext context) {
    setState(() {
      isLoadingAnimation = true;
      isShowConffeti = true;
    });
    Future.delayed(
      const Duration(seconds: 1),
      () {
        if (_formkey.currentState!.validate()) {
          check.fire();
          Future.delayed(const Duration(seconds: 2), () {
            setState(() {
              isLoadingAnimation = false;
            });

            confetti.fire();
          });
        } else {
          error.fire();
          Future.delayed(const Duration(seconds: 2), () {
            setState(() {
              isLoadingAnimation = false;
            });
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Form(
          key: _formkey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Email",
                  style: TextStyle(color: Colors.black54),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 16),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "";
                      }
                      return null;
                    },
                    onSaved: (email) {},
                    decoration: InputDecoration(
                        prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: SvgPicture.asset("assets/icons/email.svg"),
                    )),
                  ),
                ),
                const Text(
                  "Password",
                  style: TextStyle(color: Colors.black54),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 16),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "";
                      }
                      return null;
                    },
                    onSaved: (Password) {},
                    obscureText: true,
                    decoration: InputDecoration(
                        prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: SvgPicture.asset("assets/icons/password.svg"),
                    )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 24),
                  child: ElevatedButton.icon(
                      onPressed: () {
                        signIn(context);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFF77D8E),
                          minimumSize: const Size(double.infinity, 56),
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(25),
                            bottomLeft: Radius.circular(25),
                            bottomRight: Radius.circular(25),
                          ))),
                      icon: const Icon(
                        Icons.arrow_forward,
                        color: Color(0xFFFE0037),
                      ),
                      label: const Text("Sign in")),
                )
              ],
            ),
          ),
        ),
        isLoadingAnimation
            ? CustomPositioned(
                child: RiveAnimation.asset(
                  "assets/riveAssets/check.riv",
                  onInit: (artboard) {
                    StateMachineController controller =
                        getRiveContoller(artboard);
                    check = controller.findSMI("Check") as SMITrigger;
                    error = controller.findSMI("Error") as SMITrigger;
                    reset = controller.findSMI("Reset") as SMITrigger;
                  },
                ),
              )
            : const SizedBox(),
        isShowConffeti
            ? CustomPositioned(
                child: Transform.scale(
                  scale: 6,
                  child: RiveAnimation.asset("assets/riveAssets/confetti.riv",
                      onInit: (artboard) {
                    StateMachineController controller =
                        getRiveContoller(artboard);
                    confetti =
                        controller.findSMI("Trigger explosion") as SMITrigger;
                  }),
                ),
              )
            : const SizedBox()
      ],
    );
  }
}

class CustomPositioned extends StatelessWidget {
  final Widget child;
  final double size;
  CustomPositioned({Key? key, required this.child, this.size = 100})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
        child: Column(
      children: [
        const Spacer(),
        SizedBox(
          height: size,
          width: size,
          child: child,
        ),
        const Spacer(
          flex: 2,
        ),
      ],
    ));
  }
}
