import 'package:flutter/material.dart';

class PlannerButton extends StatelessWidget {
  final String startcl, startmin, finishcl, finishmin;
  final String project, fstmem, scdmem, trdmem, other;
  final Color bgColor;

  const PlannerButton({
    super.key,
    required this.project,
    required this.fstmem,
    required this.scdmem,
    required this.trdmem,
    required this.other,
    required this.bgColor,
    required this.startcl,
    required this.startmin,
    required this.finishcl,
    required this.finishmin,
  });

  @override
  Widget build(Object context) {
    List<String> projectfn = project.split(' ');
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(45),
        color: bgColor,
      ),
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              Row(
                children: [
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    children: [
                      Text(
                        startcl,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 25),
                      ),
                      Text(startmin),
                      const Text('|', style: TextStyle(fontSize: 20)),
                      Text(
                        finishcl,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 25),
                      ),
                      Text(finishmin)
                    ],
                  ),
                  const SizedBox(width: 30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        projectfn[0],
                        style: const TextStyle(
                            fontSize: 40, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        projectfn[1],
                        style: const TextStyle(
                            fontSize: 40, fontWeight: FontWeight.w600),
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 45),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MemberName(memname: fstmem),
                      MemberName(memname: scdmem),
                      MemberName(memname: trdmem),
                      MemberName(memname: other),
                    ]),
              ),
            ],
          )),
    );
  }
}

class MemberName extends StatelessWidget {
  const MemberName({
    super.key,
    required this.memname,
  });

  final String memname;

  @override
  Widget build(BuildContext context) {
    return Text(
      memname,
      style: TextStyle(color: Colors.black.withOpacity(0.5)),
    );
  }
}
