import 'package:flutter/material.dart';

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

enum CircleSide {
  left,
  right,
}

extension ToPath on CircleSide {
  Path toPath(Size size) {
    var path = Path();
    late Offset offset;
    late bool clockWise;
    switch (this) {
      case CircleSide.left:
        path.moveTo(size.width, 0);
        offset = Offset(size.width, size.height);
        clockWise = false;
        break;
      case CircleSide.right:
        offset = Offset(0, size.height);
        clockWise = true;
        break;
    }
    path.arcToPoint(
      offset,
      radius: Radius.elliptical(
        size.width / 2,
        size.height / 2,
      ),
      clockwise: clockWise,
    );
    path.close();
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.blue,
              height: 100,
              width: 100,
            ),
            Container(
              color: Colors.yellow,
              height: 100,
              width: 100,
            ),
          ],
        ),
      ),
    );
  }
}
