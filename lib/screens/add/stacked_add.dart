import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:calculs/data/failure.dart';
import 'package:calculs/data/success.dart';
import 'package:calculs/providers/addition.dart';
import 'package:calculs/repository/profile.dart';
import 'package:calculs/widgets/numbers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StackedAddScreen extends ConsumerStatefulWidget {
  const StackedAddScreen({super.key});

  @override
  ConsumerState<StackedAddScreen> createState() => _StackedAddScreenState();
}

class _StackedAddScreenState extends ConsumerState<StackedAddScreen> {
  String _userInput = "";
  final AudioPlayer _player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    final addState = ref.watch(additionProvider);

    List<String> firstValue = addState.firstValue.toString().split('');
    List<String> secondValue = addState.secondValue.toString().split('');
    List<String> result =
        (addState.firstValue + addState.secondValue).toString().split('');

    int numberOfColumns = max(firstValue.length, secondValue.length);
    numberOfColumns = max(numberOfColumns, result.length);

    if (firstValue.length < numberOfColumns) {
      firstValue = List.generate(
        numberOfColumns - firstValue.length,
        (index) => "",
      )..addAll(firstValue);
    }

    if (secondValue.length < numberOfColumns) {
      secondValue = List.generate(
        numberOfColumns - secondValue.length,
        (index) => "",
      )..addAll(secondValue);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: SizedBox(
              width: 120.0,
              child: Column(
                children: [
                  Table(
                    children: [
                      TableRow(
                        children: [
                          const Text(""),
                          for (int i = 0; i < numberOfColumns; i++)
                            Center(
                              child: Container(
                                width: 25.0,
                                height: 25.0,
                                decoration: BoxDecoration(
                                  border: i == numberOfColumns - 1
                                      ? null
                                      : Border.all(
                                          color: Theme.of(context).primaryColor,
                                          width: 1.0,
                                        ),
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                child: Text(
                                  i == numberOfColumns - 1 ? "" : "1",
                                  style: TextStyle(
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Text(""),
                          ...firstValue.map(
                            (e) => Text(
                              e,
                              style: Theme.of(context).textTheme.displayMedium,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Text(
                            "+",
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          ...secondValue.map(
                            (e) => Text(
                              e,
                              style: Theme.of(context).textTheme.displayMedium,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          const Divider(
                            color: Colors.black,
                            height: 5.0,
                            thickness: 2.0,
                          ),
                          for (int i = 0; i < numberOfColumns; i++)
                            const Divider(
                              color: Colors.black,
                              height: 5.0,
                              thickness: 2.0,
                            ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Text(
                            "=",
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          ...result.map(
                            (e) => Text(
                              e.toString(),
                              style: Theme.of(context).textTheme.displayMedium,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Divider(),
          const SizedBox(height: 20),
          Numbers(
            onPressed: (value) {
              setState(() {
                // TODO: Implement the user input logic
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
                      // TODO: Implement the clear logic
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
                  setState(() {
                    ref.read(additionProvider.notifier).regenerateNumbers();
                  });
                  // TODO: Implement the validation logic
                  // await ProfileRepository.incrementAdditions();

                  // final isCorrect = int.tryParse(_userInput) == result;

                  // if (!context.mounted) {
                  //   return;
                  // }

                  // if (isCorrect) {
                  //   _player.play(AssetSource("audio/success.mp3"));
                  //   ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  //   ScaffoldMessenger.of(context).showSnackBar(
                  //     SnackBar(
                  //       backgroundColor: Colors.green,
                  //       content: Text(
                  //         successMessages[
                  //             Random().nextInt(successMessages.length)],
                  //       ),
                  //     ),
                  //   );
                  //   setState(() {
                  //     _userInput = "?";
                  //   });

                  //   ProfileRepository.incrementCorrectAdditions();
                  // } else {
                  //   _player.play(AssetSource("audio/error.mp3"));
                  //   ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  //   ScaffoldMessenger.of(context).showSnackBar(
                  //     SnackBar(
                  //       backgroundColor:
                  //           const Color.fromARGB(255, 214, 100, 100),
                  //       content: Text(
                  //         failureMessages[
                  //             Random().nextInt(failureMessages.length)],
                  //       ),
                  //     ),
                  //   );
                  // }
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
