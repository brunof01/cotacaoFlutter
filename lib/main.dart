import 'package:cotacao/controllerBinding.dart';
import 'package:cotacao/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  ControllerBinding().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
