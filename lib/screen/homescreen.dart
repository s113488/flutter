import 'package:flutter/material.dart';
import 'dart:async';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  static int twentyFiveMinutes = 1500;
  static int totalsecons = twentyFiveMinutes;
  late Timer timer;
  bool isRunning = false;
  int totalPomodoro = 0;
  int cyclePomodoro = 0;
  final int boundarytotal = 4;
  final int boundarycycle = 12;

  void onClick(Timer timer) {
    if (totalsecons == 0) {
      setState(() {
        isRunning = false;
        if (totalPomodoro < boundarytotal - 1) {
          totalPomodoro += 1;
        } else {
          totalPomodoro = 0;
          cyclePomodoro += 1;
        }

        totalsecons = twentyFiveMinutes;
      });
      timer.cancel();
    } else {
      setState(() {
        totalsecons -= 1;
      });
    }
  }

  void onStartPressed() {
    timer = Timer.periodic(const Duration(seconds: 1), onClick);
    setState(() {
      isRunning = true;
    });
  }

  void onPausePressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  void onResetPressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
      totalsecons = twentyFiveMinutes;
    });
  }

  String format(int seconds) {
    Duration time = Duration(seconds: seconds);
    return time.toString().split('.').first.substring(2, 7);
  }

  void onSettingTime(int settingtime) {
    onResetPressed();
    setState(() {
      totalsecons = settingtime;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        children: [
          Flexible(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    format(totalsecons),
                    style: TextStyle(
                      color: Theme.of(context).cardColor,
                      fontSize: 89,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SelectTime(settingtime: 15),
                      SelectTime(settingtime: 20),
                      SelectTime(settingtime: 25),
                      SelectTime(settingtime: 30),
                      SelectTime(settingtime: 35),
                    ],
                  ),
                )
              ],
            ),
          ),
          Flexible(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  iconSize: 120,
                  color: Theme.of(context).cardColor,
                  onPressed: isRunning ? onPausePressed : onStartPressed,
                  icon:
                      Icon(isRunning ? Icons.pause : Icons.play_circle_outline),
                ),
                IconButton(
                  iconSize: 60,
                  color: Theme.of(context).cardColor,
                  onPressed: onResetPressed,
                  icon: const Icon(Icons.stop_circle),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: Row(
              children: [
                CountCycle(
                  istotal: true,
                  totalPomodoro: totalPomodoro,
                  cyclePomodoro: cyclePomodoro,
                  boundarycycle: boundarycycle,
                  boundarytotal: boundarytotal,
                ),
                CountCycle(
                  istotal: false,
                  totalPomodoro: totalPomodoro,
                  cyclePomodoro: cyclePomodoro,
                  boundarycycle: boundarycycle,
                  boundarytotal: boundarytotal,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SelectTime extends StatelessWidget {
  const SelectTime({super.key, required this.settingtime});
  final int settingtime;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(width: 4, color: Theme.of(context).cardColor)),
        child: InkWell(
          onTap: () {
            _HomescreenState.totalsecons = settingtime * 60;
          },
          child: Center(
            child: Text(
              '$settingtime',
              style: TextStyle(
                  color: Theme.of(context).cardColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ));
  }
}

// ignore: must_be_immutable
class CountCycle extends StatelessWidget {
  CountCycle({
    super.key,
    required this.istotal,
    required this.totalPomodoro,
    required this.cyclePomodoro,
    required this.boundarytotal,
    required this.boundarycycle,
  });
  int totalPomodoro;
  int cyclePomodoro;
  final int boundarytotal;
  final int boundarycycle;
  final bool istotal;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(color: Theme.of(context).cardColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              istotal ? 'ROUND' : 'GOAL',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).textTheme.headlineLarge!.color),
            ),
            Text(
              istotal
                  ? '$totalPomodoro/$boundarytotal'
                  : '$cyclePomodoro/$boundarycycle',
              style: TextStyle(
                  fontSize: 58,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).textTheme.headlineLarge!.color),
            ),
          ],
        ),
      ),
    );
  }
}
