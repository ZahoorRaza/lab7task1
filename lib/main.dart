import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Timer App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: TimerScreen(),
    );
  }
}

class TimerScreen extends StatefulWidget {
  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  int countdownTime = 10; // Countdown start time in seconds
  bool isRunning = false;

  void startTimer() async {
    setState(() {
      isRunning = true;
    });

    for (int i = countdownTime; i > 0; i--) {
      await Future.delayed(Duration(seconds: 1), () {
        setState(() {
          countdownTime--;
        });
      });
    }

    setState(() {
      isRunning = false;
      countdownTime = 10; // Reset the timer
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Timer App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$countdownTime',
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: isRunning ? null : startTimer,
              child: Text(isRunning ? 'Running...' : 'Start Timer'),
            ),
          ],
        ),
      ),
    );
  }
}
