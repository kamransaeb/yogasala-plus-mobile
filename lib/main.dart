import 'package:enterprise_ui/enterprise_ui.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const YogaSalaPlusApp());
}

class YogaSalaPlusApp extends StatelessWidget {
  const YogaSalaPlusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yoga Sala Plus',
      theme: AppTheme.light(seed: Colors.teal),
      darkTheme: AppTheme.dark(seed: Colors.teal),
      home: const _HomePage(),
    );
  }
}

class _HomePage extends StatelessWidget {
  const _HomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yoga Sala Plus'),
      ),
      body: Center(
        child: AppButton(
          label: 'Packages connected',
          onPressed: () {},
        ),
      ),
    );
  }
}
