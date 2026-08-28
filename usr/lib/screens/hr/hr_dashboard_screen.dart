import 'package:flutter/material.dart';

class HrDashboardScreen extends StatelessWidget {
  const HrDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HR Dashboard')),
      body: const Center(child: Text('HR Dashboard Screen')),
    );
  }
}
