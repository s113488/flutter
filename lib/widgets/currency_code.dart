import 'dart:ui';

import 'package:flutter/material.dart';

class CurrencyCode extends StatelessWidget {
  final String name, amount, code;
  final IconData icon;
  final bool isInverted;
  final int order;

  final _blackcolor = const Color(0xFF1F2123);

  const CurrencyCode({
    super.key,
    required this.name,
    required this.amount,
    required this.code,
    required this.icon,
    required this.isInverted,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, -20 * (order - 1)),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: isInverted ? Colors.white : _blackcolor),
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Euro',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: isInverted ? _blackcolor : Colors.white),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        '6 428',
                        style: TextStyle(
                            fontSize: 20,
                            color: isInverted ? _blackcolor : Colors.white),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        'EUR',
                        style: TextStyle(
                            color: isInverted
                                ? _blackcolor.withOpacity(0.8)
                                : Colors.white.withOpacity(0.8),
                            fontSize: 20),
                      ),
                    ],
                  )
                ],
              ),
              Transform.scale(
                scale: 2.2,
                child: Transform.translate(
                    offset: const Offset(-5, 15),
                    child: Icon(
                      icon,
                      color: isInverted ? _blackcolor : Colors.white,
                      size: 78,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
