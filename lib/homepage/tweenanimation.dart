import 'package:flutter/material.dart';

class TweenAnimation extends StatefulWidget {
  const TweenAnimation({super.key});

  @override
  State<TweenAnimation> createState() => _TweenAnimationState();
}

class _TweenAnimationState extends State<TweenAnimation> {
  double target = 24.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 0, end: target),
          duration: const Duration(seconds: 1),
          builder: (BuildContext context, double size, Widget? child) {
            return TextButton(
              onPressed: () {
                target = ((target == 48.0) ? 96.0 : 48.0);
                setState(() {});
              },
              child: Text(
                'Text',
                style: TextStyle(fontSize: size),
              ),
            );
          },
        ),
      ),
    );
  }
}
