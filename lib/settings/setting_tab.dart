import 'package:flutter/material.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.blueGrey,
      alignment: Alignment.center,
      child: const Text('Settings'),
    );
  }
}