import 'dart:math';

import 'package:flutter/material.dart';

class SubtractScreen extends StatelessWidget {
  const SubtractScreen({super.key});

  int _getRandomInt() {
    // get max value from user preferences
    return Random().nextInt(100);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            mainAxisAlignment: MainAxisAlignment.center,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                "${_getRandomInt()} - ${_getRandomInt()} = ",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(
                width: 75,
                child: TextField(
                  style: Theme.of(context).textTheme.headlineMedium,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
            ),
            onPressed: () {},
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.0),
              child: Text('Ok'),
            ),
          ),
        ],
      ),
    );
  }
}
