// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutteranimation/homepage/tweenanimation.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
      lowerBound: 0,
      upperBound: 200,
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _controller.forward();
    _controller.addListener(() {
      setState(() {});
      print('_Controller.value');
      print(_controller.value);
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            bottom: _controller.value / 2,
            left: _controller.value / 2,
            right: _controller.value / 2,
            child: Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration(
                color: Colors.red,
              ),
            ),
          )
        ],
      ),
      floatingActionButton: Row(
        children: [
          FloatingActionButton(
            onPressed: () {
              _controller.stop();
              _controller.value == 0
                  ? _controller.forward()
                  : _controller.reverse();
            },
          ),
          FloatingActionButton(
            onPressed: () {
              _controller.stop();
            },
          ),
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TweenAnimation(),
                  ));
            },
            child: const Icon(Icons.push_pin),
          )
        ],
      ),
    );
  }
}
