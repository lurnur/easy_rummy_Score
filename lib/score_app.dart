import 'package:flutter/material.dart';
import 'package:easy_rummy_score/score_home.dart';

class ScoreApp extends StatelessWidget {
  const ScoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Easy Rummy Score',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
        useMaterial3: true,
      ),
      home: const ScoreAppHome(),
    );
  }
}