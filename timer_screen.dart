import 'dart:async';
import 'package:flutter/material.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({super.key});

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {

  int seconds = 1500;

  Timer? timer;

  void startTimer() {

    timer?.cancel();

    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {

        if (seconds > 0) {

          setState(() {
            seconds--;
          });

        } else {

          timer.cancel();

        }
      },
    );
  }

  void resetTimer() {

    timer?.cancel();

    setState(() {
      seconds = 1500;
    });
  }

  @override
  Widget build(BuildContext context) {

    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;

    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),

      appBar: AppBar(
        title: const Text("Pomodoro Timer"),
        backgroundColor: Colors.transparent,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            Text(
              "${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}",
              style: const TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: startTimer,
              child: const Text("Start"),
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: resetTimer,
              child: const Text("Reset"),
            ),
          ],
        ),
      ),
    );
  }
}