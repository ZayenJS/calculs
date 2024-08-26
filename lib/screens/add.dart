import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:calculs/data/failure.dart';
import 'package:calculs/data/success.dart';
import 'package:calculs/providers/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddScreen extends ConsumerStatefulWidget {
  const AddScreen({super.key});

  @override
  ConsumerState<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends ConsumerState<AddScreen> {
  final TextEditingController _userInputController = TextEditingController();
  final AudioPlayer _player = AudioPlayer();

  int _getRandomInt() {
    // get max value from user preferences
    return Random().nextInt(40);
  }

  @override
  Widget build(BuildContext context) {
    final firstNumber = _getRandomInt();
    final secondNumber = _getRandomInt();

    final result = firstNumber + secondNumber;

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
                "$firstNumber + $secondNumber = ",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(
                width: 75,
                child: TextField(
                  controller: _userInputController,
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
            onPressed: () async {
              await ref.read(profileProvider.notifier).incrementAdditions();

              final isCorrect =
                  int.tryParse(_userInputController.text) == result;

              if (!context.mounted) {
                return;
              }

              if (isCorrect) {
                _player.play(AssetSource("audio/success.mp3"));
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.green,
                    content: Text(
                      successMessages[Random().nextInt(successMessages.length)],
                    ),
                  ),
                );
                setState(() {
                  _userInputController.clear();
                });

                ref.read(profileProvider.notifier).incrementCorrectAdditions();
              } else {
                _player.play(AssetSource("audio/error.mp3"));
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: const Color.fromARGB(255, 214, 100, 100),
                    content: Text(
                      failureMessages[Random().nextInt(failureMessages.length)],
                    ),
                  ),
                );
              }
            },
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
