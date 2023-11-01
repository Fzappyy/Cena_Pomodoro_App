import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * .5,
          width: MediaQuery.of(context).size.width * .5,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.blueAccent),
        ),
      ),
    ));
  }
}
