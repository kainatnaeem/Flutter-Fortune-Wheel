import 'package:flutter/material.dart';
import 'package:flutterwheelbyktech/fortunewheel.dart';
 //IG || flutterbyktech
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Fortune Wheel ',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: const SpinWheel());
  }
}
