import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: ClipPath(
          clipper: MyCustomClipper(),
          child: Container(
            width: 200,
            height: 200,
            color: Colors.pink,
          )
        )
      )
    );
  }
}

class MyCustomClipper extends CustomClipper<Path>{
@override
Path getClip(Size size) {
    Path path = Path()
      ..moveTo(size.width/2, 0)
      ..relativeLineTo(50, size.height)
      ..lineTo(size.width, size.height)
      ..close();

    return path;
}
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
