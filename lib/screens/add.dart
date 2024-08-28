import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:calculs/data/failure.dart';
import 'package:calculs/data/success.dart';
import 'package:calculs/providers/addition.dart';
import 'package:calculs/repository/profile.dart';
import 'package:calculs/widgets/numbers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddScreen extends ConsumerStatefulWidget {
  const AddScreen({super.key});

  @override
  ConsumerState<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends ConsumerState<AddScreen> {
  String _userInput = "?";
  final AudioPlayer _player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    final addState = ref.watch(additionProvider);
    final result = addState.firstValue + addState.secondValue;

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
                "${addState.firstValue} + ${addState.secondValue} = ",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Text(
                _userInput,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Divider(),
          const SizedBox(height: 20),
          Numbers(
            onPressed: (value) {
              setState(() {
                if (_userInput.length > 10) {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: Colors.red,
                      content: Text(
                        "Le nombre est trop long",
                      ),
                    ),
                  );

                  return;
                }

                if (_userInput.contains('?')) {
                  _userInput = "";
                }

                _userInput += value.toString();
              });
            },
          ),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.onPrimary,
                  foregroundColor: Theme.of(context).colorScheme.primary,
                ),
                onPressed: () {
                  setState(
                    () {
                      _userInput = "?";
                    },
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  child: Text('Effacer'),
                ),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                ),
                onPressed: () async {
                  await ProfileRepository.incrementAdditions();

                  final isCorrect = int.tryParse(_userInput) == result;

                  if (!context.mounted) {
                    return;
                  }

                  if (isCorrect) {
                    _player.play(AssetSource("audio/success.mp3"));
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.green,
                        content: Text(
                          successMessages[
                              Random().nextInt(successMessages.length)],
                        ),
                      ),
                    );
                    setState(() {
                      _userInput = "?";
                    });

                    ProfileRepository.incrementCorrectAdditions();
                  } else {
                    _player.play(AssetSource("audio/error.mp3"));
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor:
                            const Color.fromARGB(255, 214, 100, 100),
                        content: Text(
                          failureMessages[
                              Random().nextInt(failureMessages.length)],
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
        ],
      ),
    );
  }
}
