import 'dart:async';

import 'package:cena_pomodoro_app/components/button.dart';
import 'package:cena_pomodoro_app/components/tab_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController controller = TextEditingController();
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
    String minutes = strDigits(userMinutes.inMinutes.remainder(60));
    String seconds = strDigits(userMinutes.inSeconds.remainder(60));
    return DefaultTabController(
      length: 3,
      child: SafeArea(
          child: Scaffold(
        backgroundColor: const Color(0xFF164863),
        body: ListView(children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50),
            child: Align(
              alignment: Alignment.topCenter,
              child: Text(
                'Study',
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold)),
              ),
            ),
          ),
          CircleAvatar(
            radius: MediaQuery.of(context).size.width * .4,
            backgroundColor: const Color(0xFF427D9D),
            child: Text(
              '$minutes:$seconds',
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      letterSpacing: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 50)),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const SizedBox(
            child: TabBar(
                unselectedLabelColor: Color.fromARGB(255, 219, 93, 93),
                indicatorPadding: EdgeInsets.symmetric(horizontal: 10),
                labelPadding: EdgeInsets.symmetric(horizontal: 20),
                tabs: [
                  TabBarText(text: 'Home'),
                  TabBarText(text: 'Time'),
                  TabBarText(text: 'About'),
                ]),
          ),
          SizedBox(
            width: double.infinity,
            height: 300,
            child: TabBarView(children: [
              Container(
                margin: const EdgeInsets.only(top: 10),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover, image: AssetImage('assets/bg.png')),
                    color: Color(0xFFFCFCFC),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16))),
                child: Align(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                            onTap: () {
                              int timeMinutes = 1;
                              if (controller.text == '') {
                                controller.text = '1';
                              }
                              timeMinutes = int.parse(controller.text);
                              userMinutes = Duration(minutes: timeMinutes);
                              controller.clear;
                              countDown?.cancel();
                              startTime();
                            },
                            child: const MyButton(text: 'Reset')),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                int timeMinutes = 1;
                                if (controller.text == '') {
                                  controller.text = '1';
                                }
                                timeMinutes = int.parse(controller.text);
                                userMinutes = Duration(minutes: timeMinutes);
                                controller.clear;
                                countDown?.cancel();
                                startTime();
                              });
                            },
                            child: const MyButton(text: 'Start')),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                countDown!.cancel();
                                userMinutes = const Duration(minutes: 0);
                                startTime();
                              });
                            },
                            child: const MyButton(text: 'Cancel')),
                      ],
                    )),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.all(24),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover, image: AssetImage('assets/bg.png')),
                    color: Color(0xFFFCFCFC),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16))),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'After input, go to Home tab',
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  color: Color(0xFF19202D),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600)),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextField(
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF19202D))),
                        controller: controller,
                        decoration: InputDecoration(
                          labelStyle: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF19202D))),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                            width: 2,
                            color: Color.fromARGB(255, 17, 141, 208),
                          )),
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2, color: Color(0xFF164863))),
                          contentPadding: const EdgeInsets.all(20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          labelText: 'Duration in Minutes',
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const MyButton(
                        text: "Pomodoro",
                      )
                    ]),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover, image: AssetImage('assets/bg.png')),
                    color: Color(0xFFFCFCFC),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16))),
                child: ListView(children: [
                  Container(
                    margin: const EdgeInsets.all(16),
                    height: 200,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 2, color: const Color(0xFF19202D)),
                        borderRadius: BorderRadius.circular(18),
                        image: const DecorationImage(
                            alignment: Alignment.bottomCenter,
                            fit: BoxFit.cover,
                            image: AssetImage('assets/felix.png'))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.white),
                      child: Text(
                        "Hi there! I'm Felix Cena Jr. I've made a simple Pomodoro app using Flutter. It's a simple tool for better time management. With a focus on simplicity, I aimed to help boost productivity without fuss. I hope this little creation aids your daily tasks. Stay humble, stay focused, and keep striving for your goals.",
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500)),
                      ),
                    ),
                  )
                ]),
              ),
            ]),
          )
        ]),
      )),
    );
  }
}
