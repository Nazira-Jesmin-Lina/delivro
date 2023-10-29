import 'package:delivro/Pages/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

// Command Interface
abstract class AnimationCommand {
  void execute(_MyOrderProcessingPageState state);
}

// Concrete Command for Changing Animation
class NextAnimationCommand implements AnimationCommand {
  @override
  void execute(_MyOrderProcessingPageState state) {
    state._nextAnimation();
  }
}

class MyOrderProcessingPage extends StatefulWidget {
  @override
  _MyOrderProcessingPageState createState() => _MyOrderProcessingPageState();
}

class _MyOrderProcessingPageState extends State<MyOrderProcessingPage> {
  int _animationStep = 0;
  final List<AnimationCommand> animationCommands = [
    NextAnimationCommand(),
    NextAnimationCommand(),
    NextAnimationCommand(),
  ];

  void _nextAnimation() {
    setState(() {
      _animationStep++;
    });

    // Delay navigation to the HomePage after the last animation
    if (_animationStep == 3) {
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
        );
      });
    }
  }

  @override
  void initState() {
    super.initState();

    // Start the animations after a 5-second delay for each animation
    for (var i = 0; i < 3; i++) {
      Future.delayed(Duration(seconds: 5 * (i + 1)), () {
        animationCommands[i].execute(this);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget currentAnimation;
    String animationText;

    if (_animationStep == 0) {
      animationText = 'Order has been placed';
      currentAnimation = Lottie.asset('Animation/dd.json');
    } else if (_animationStep == 1) {
      animationText = 'Preparing your Food';
      currentAnimation = Lottie.asset('Animation/bb.json');
    } else if (_animationStep == 2) {
      animationText = 'Rider has picked your food';
      currentAnimation = Lottie.asset('Animation/deliver.json');
    } else {
      animationText = 'Get Ready!!!!!!!!!!!!';
      currentAnimation = SizedBox(); // No animation after the third one
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              animationText,
              style: TextStyle(
                fontSize: 30,
                color: Color.fromARGB(255, 200, 15, 104),
                fontFamily: 'Pacifico',
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20), // Adjust the spacing between text and animation
            currentAnimation,
          ],
        ),
      ),
    );
  }
}
