import 'package:flutter/material.dart';
import 'screens/user_page.dart';

void main() {
  runApp(const SmartEventApp());
}

class SmartEventApp extends StatelessWidget {
  const SmartEventApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Event Management Platform',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        useMaterial3: true,
      ),
      home: const UserPage(),
    );
  }
}
