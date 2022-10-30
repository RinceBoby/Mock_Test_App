import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mock_test/view/screens/screen%201/screen_1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mock Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ScreenOne(),
    );
  }
}
