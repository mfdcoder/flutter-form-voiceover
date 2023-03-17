import 'package:flutter/material.dart';

class MyDetailScreen extends StatelessWidget {
  static const routerName = '/detail-screen';

  const MyDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('I am detail screen'),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Go back to Parent screen'),
            ),
          ],
        ),
      ),
    );
  }
}
