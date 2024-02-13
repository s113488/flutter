import 'package:app/widgets/plannerbutton.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Planner());
}

class Planner extends StatelessWidget {
  const Planner({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF79b7e8),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                const SizedBox(height: 60),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(180.0),
                      child: SizedBox(
                        width: 60,
                        height: 60,
                        child: Image.asset('assets/images/bunny.jpeg'),
                      ),
                    ),
                    const Icon(Icons.add)
                  ],
                ),
                const SizedBox(height: 30),
                const Row(
                  children: [
                    Text(
                      'Monday',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    SizedBox(width: 10),
                    Text(
                      '16',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Text(
                        'TODAY',
                        style: TextStyle(color: Colors.white, fontSize: 40),
                      ),
                      SizedBox(width: 10),
                      Icon(Icons.assignment_turned_in_rounded,
                          color: Colors.red),
                      SizedBox(width: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          NextDays(day: '17'),
                          SizedBox(width: 10),
                          NextDays(day: '18'),
                          SizedBox(width: 10),
                          NextDays(day: '19'),
                          SizedBox(width: 10),
                          NextDays(day: '20')
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                const PlannerButton(
                    project: 'DESIGN MEETING',
                    fstmem: 'ALEX',
                    scdmem: 'HELENA',
                    trdmem: 'NANA',
                    other: ' ',
                    bgColor: Color(0xFFf8e65f),
                    startcl: '11',
                    startmin: "30",
                    finishcl: '12',
                    finishmin: '20'),
                const SizedBox(height: 5),
                const PlannerButton(
                    project: 'DAILY PROJECT',
                    fstmem: 'ME',
                    scdmem: 'RICHARD',
                    trdmem: 'CIRY',
                    other: '+4',
                    bgColor: Color(0xFF89d44e),
                    startcl: '12',
                    startmin: "35",
                    finishcl: '14',
                    finishmin: '10'),
                const SizedBox(height: 5),
                const PlannerButton(
                    project: 'WEEKLY PLANNING',
                    fstmem: 'DEN',
                    scdmem: 'NANA',
                    trdmem: 'MARK',
                    other: ' ',
                    bgColor: Color(0xFF4756d4),
                    startcl: '15',
                    startmin: "00",
                    finishcl: '16',
                    finishmin: '00')
              ],
            )),
      ),
    );
  }
}

class NextDays extends StatelessWidget {
  final String day;
  const NextDays({super.key, required this.day});

  @override
  Widget build(BuildContext context) {
    return Text(
      day,
      style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 40),
    );
  }
}
