import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:calculs/data/failure.dart';
import 'package:calculs/data/success.dart';
import 'package:calculs/providers/multiplication.dart';
import 'package:calculs/repository/multiplications.dart';
import 'package:calculs/repository/profile.dart';
import 'package:calculs/widgets/numbers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InlineMultiplyScreen extends ConsumerStatefulWidget {
  const InlineMultiplyScreen({super.key});

  @override
  ConsumerState<InlineMultiplyScreen> createState() =>
      _InlineMultiplyScreenState();
}

class _InlineMultiplyScreenState extends ConsumerState<InlineMultiplyScreen> {
  String _userInput = "?";
  final AudioPlayer _player = AudioPlayer();
  int _attempts = 1;
  final int _maxAttempts = 3;

  @override
  Widget build(BuildContext context) {
    final multiplyState = ref.watch(multiplicationProvider);
    final result = multiplyState.firstValue * multiplyState.secondValue;

    return Scaffold(
        appBar: AppBar(
          title: const Text(""),
        ),
        body: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  mainAxisAlignment: MainAxisAlignment.center,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      "${multiplyState.firstValue} x ${multiplyState.secondValue} = ",
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
                        backgroundColor:
                            Theme.of(context).colorScheme.onPrimary,
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
                        foregroundColor:
                            Theme.of(context).colorScheme.onPrimary,
                      ),
                      onPressed: () async {
                        await ProfileRepository.incrementMultiplications();

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
                            _attempts = 1;
                            _userInput = "?";
                            ref
                                .read(multiplicationProvider.notifier)
                                .regenerateNumbers();
                          });

                          MultiplicationsRepository.addMultiplication(
                            firstValue: firstValue,
                            secondValue: secondValue,
                            attempts: _attempts,
                            isCorrect: isCorrect,
                          );
                        } else {
                          if (_attempts + 1 > _maxAttempts) {
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "Tu as utilisé tous tes essais ! La réponse était $result. (${multiplyState.firstValue} x ${multiplyState.secondValue} = $result)",
                                ),
                              ),
                            );

                            setState(() {
                              _attempts = 1;
                              _userInput = "?";
                              ref
                                  .read(multiplicationProvider.notifier)
                                  .regenerateNumbers();
                            });

                            MultiplicationsRepository.addMultiplication(
                              firstValue: firstValue,
                              secondValue: secondValue,
                              attempts: _attempts,
                              isCorrect: isCorrect,
                            );
                            return;
                          }

                          setState(() {
                            _attempts++;
                          });

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
            Positioned(
              top: 0.0,
              right: 10.0,
              child: Text("Essais: $_attempts / $_maxAttempts"),
            ),
          ],
        ));
  }
}
