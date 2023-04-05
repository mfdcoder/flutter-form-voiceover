import 'package:flutter/material.dart';

class MyAccessibileNavigation extends StatelessWidget {
  const MyAccessibileNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Detecting if screen reader is enabled',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          const Text(
            'On web, we are unable to detect if screen readers are enabled using mediaQueryData.accessibleNavigation \nValue is always returned as enabled \nThe mediaQueryData.accessibleNavigation return correct value on mobile app',
          ),
          const SizedBox(height: 10),
          Text(
            ' >>> mediaQueryData.accessibleNavigation = ${mediaQueryData.accessibleNavigation}',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
