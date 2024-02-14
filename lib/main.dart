import 'package:app/services/api_services.dart';
import 'package:app/widgets/button.dart';
import 'package:app/widgets/currency_code.dart';
import 'package:flutter/material.dart';

void main() {
  ApiServices().getTodaysToons();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF1f1f1f),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 80),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          'Hey, Selena',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'Welcome back!',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 18,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'Total balance',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text('\$5 194 482',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w600,
                      color: Colors.white.withOpacity(0.8),
                    )),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Button(
                      text: 'Transfer',
                      textColor: Colors.black,
                      bgColor: Colors.amber,
                    ),
                    Button(
                      text: 'Request',
                      textColor: Colors.white,
                      bgColor: Color(0xFF1F2123),
                    )
                  ],
                ),
                const SizedBox(
                  height: 60,
                ),
                Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Wallets',
                        style: TextStyle(
                            fontSize: 36,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        'View All',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ),
                    ]),
                const SizedBox(
                  height: 20,
                ),
                const CurrencyCode(
                    name: 'EURO',
                    amount: '6 248',
                    code: 'EUR',
                    icon: Icons.euro_outlined,
                    isInverted: false,
                    order: 1),
                const CurrencyCode(
                    name: 'Bitcoin',
                    amount: '9 234',
                    code: 'BTC',
                    icon: Icons.currency_bitcoin_outlined,
                    isInverted: true,
                    order: 2),
                const CurrencyCode(
                    name: 'Dollar',
                    amount: '6 248',
                    code: 'USD',
                    icon: Icons.attach_money_rounded,
                    isInverted: false,
                    order: 3),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
