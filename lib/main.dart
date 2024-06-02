import 'package:flutter/material.dart';

void main() {
  runApp(const SocialNetworkingApp());
}

class SocialNetworkingApp extends StatelessWidget {
  const SocialNetworkingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
