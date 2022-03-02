import 'dart:math';

import 'package:dashboard/constants/style.dart';
import 'package:flutter/material.dart';

class SmallSceen extends StatelessWidget {
  const SmallSceen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimationGraph();

    // Container(
    //   color: Colors.green,
    //   child: Center(
    //     child: AnimatedContainer(
    //       transform: Matrix4.rotationX(20),
    //       height: 200,
    //       width: 200,
    //       duration: const Duration(seconds: 2),
    //       alignment: Alignment.center,
    //       margin: const EdgeInsets.all(10),
    //       curve: Curves.bounceInOut,
    //       color: Colors.amber,
    //       child: const Text('Heeloow'),
    //     ),
    //   ),
    // );
  }
}

class AnimationGraph extends StatefulWidget {
  const AnimationGraph({Key? key}) : super(key: key);

  @override
  State<AnimationGraph> createState() => _AnimationGraphState();
}

class _AnimationGraphState extends State<AnimationGraph> {
  double _height = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        color: light,
        alignment: Alignment.center,
        height: 400,
        width: 400,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.all(5),
              width: 50,
              height: 200,
              decoration: const BoxDecoration(
                color: Colors.black,
                // borderRadius: BorderRadius.circular(15),
              ),
              child: AnimatedContainer(
                alignment: Alignment.topCenter,
                duration: const Duration(seconds: 1),
                curve: Curves.fastOutSlowIn,
                height: _height,
                width: 50,
                color: Colors.cyan,
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.all(5),
              width: 80,
              height: 200,
              decoration: const BoxDecoration(
                color: Colors.transparent,
                // borderRadius: BorderRadius.circular(15),
              ),
              child: AnimatedContainer(
                alignment: Alignment.topCenter,
                duration: const Duration(seconds: 1),
                curve: Curves.fastOutSlowIn,
                height: _height,
                color: Colors.transparent,
                child: Container(
                  alignment: Alignment.center,
                  height: 30,
                  decoration: BoxDecoration(
                      color: dark, borderRadius: BorderRadius.circular(5)),
                  child: Text('${_height.toInt() / 2}%',
                      style: const TextStyle(color: Colors.white)),
                ),
              ),
            ),
          ],
        ),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            final random = Random();

            _height = random.nextInt(200).toDouble();
          });
        },
        child: const Icon(Icons.graphic_eq),
      ),
    );
  }
}

class AniamtionApp extends StatefulWidget {
  const AniamtionApp({Key? key}) : super(key: key);

  @override
  State<AniamtionApp> createState() => _AniamtionAppState();
}

class _AniamtionAppState extends State<AniamtionApp> {
  double _width = 70;
  double _height = 70;

  Color _color = Colors.green;

  bool isText = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedContainer(
          // clipBehavior: Clip.antiAliasWithSaveLayer,
          onEnd: () {
            setState(() {
              isText = true;
            });
          },
          width: _width,
          height: _height,
          duration: const Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
          decoration: BoxDecoration(
            color: _color,
          ),
          child: isText
              ? Center(
                  child: Text(
                  'Naval',
                  style: TextStyle(color: Colors.white, fontSize: _height / 10),
                ))
              : const SizedBox(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            isText = false;

            final random = Random();

            _width = random.nextInt(500).toDouble();
            _height = random.nextInt(500).toDouble();

            _color = Color.fromRGBO(
              random.nextInt(300),
              random.nextInt(300),
              random.nextInt(300),
              1,
            );

            // _borderRadius =
            //     BorderRadius.circular(random.nextInt(100).roundToDouble());
          });
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
