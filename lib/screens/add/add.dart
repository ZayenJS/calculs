import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:calculs/data/failure.dart';
import 'package:calculs/data/success.dart';
import 'package:calculs/providers/addition.dart';
import 'package:calculs/repository/profile.dart';
import 'package:calculs/screens/add/inline_add.dart';
import 'package:calculs/screens/add/stacked_add.dart';
import 'package:calculs/widgets/numbers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Additions", style: TextStyle(color: Colors.white)),
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
        body: Column(
          children: [
            const SizedBox(height: 50),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 86, 198, 123),
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const InlineAddScreen(),
                        ),
                      );
                    },
                    child: const Text('Additions en ligne'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 230, 74, 74),
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const StackedAddScreen(),
                        ),
                      );
                    },
                    child: const Text('Additions posées'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 210, 136, 240),
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => const InlineAddScreen(),
                      //   ),
                      // );
                    },
                    child: const Text('Additions chronométrées'),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
