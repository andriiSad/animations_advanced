import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class CircleClipper extends CustomClipper<Path> {
  const CircleClipper();
  @override
  Path getClip(Size size) {
    var path = Path();

    final rect = Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: size.width / 2,
    );

    path.addOval(rect);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

Color getRandomColor() {
  return Color.fromARGB(
    255,
    math.Random().nextInt(256),
    math.Random().nextInt(256),
    math.Random().nextInt(256),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _color = getRandomColor();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: ClipPath(
          clipper: const CircleClipper(),
          child: TweenAnimationBuilder(
            tween: ColorTween(
              begin: getRandomColor(),
              end: _color,
            ),
            onEnd: () {
              setState(() {
                _color = getRandomColor();
              });
            },
            duration: const Duration(seconds: 1),
            builder: (context, color, child) {
              return ColorFiltered(
                colorFilter: ColorFilter.mode(
                  color!,
                  BlendMode.srcATop,
                ),
                child: Container(
                  width: width,
                  height: width,
                  color: getRandomColor(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
