import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Timer? countDown;
  Duration userMinutes = const Duration(minutes: 0);
  void startTime() {
    countDown = Timer.periodic(
      const Duration(seconds: 1),
      (timer) => setCountDown(),
    );
  }

  void setCountDown() {
    const reduceSeconds = 1;
    setState(() {
      final seconds = userMinutes.inSeconds - reduceSeconds;
      if (seconds < 0) {
        countDown!.cancel();
      } else {
        userMinutes = Duration(seconds: seconds);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = strDigits(userMinutes.inMinutes.remainder(60));
    final seconds = strDigits(userMinutes.inSeconds.remainder(60));
    TextEditingController controller = TextEditingController();
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * .5,
          width: MediaQuery.of(context).size.width * .5,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: const Color.fromARGB(255, 218, 221, 225)),
          child: Column(children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  labelText: 'Minutes',
                ),
              ),
            ),
            MaterialButton(
              onPressed: () {
                setState(() {
                  int timeMinutes = 0;
                  timeMinutes = int.parse(controller.text);
                  userMinutes = Duration(minutes: timeMinutes);
                  startTime();
                });
              },
              color: Colors.amberAccent,
              child: const Text('Time'),
            ),
            const SizedBox(
              height: 50,
            ),
            Text('$minutes:$seconds'),
          ]),
        ),
      ),
    ));
  }
}
