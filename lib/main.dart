import 'package:flutter/material.dart';
import 'package:pilketos/shared/shared.dart';
import 'package:pilketos/welcome-pilketos.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'pilketos grafika',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        primaryColor: primaryColor,
        canvasColor: Colors.transparent,
      ),
      home: const Welcome(),
    );
  }
}
