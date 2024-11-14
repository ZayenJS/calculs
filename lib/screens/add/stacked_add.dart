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
  final AudioPlayer _player = AudioPlayer();
  final List<String> _userInputs = [];
  bool _addedCarry = false;

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

    if (_userInputs.length < numberOfColumns) {
      _userInputs.removeWhere((element) => element.isEmpty);

      for (int i = 0; i < numberOfColumns; i++) {
        _userInputs.insert(0, '');
      }
    }

    if (_userInputs.length > numberOfColumns) {
      _userInputs.removeRange(0, _userInputs.length - numberOfColumns);
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
                                  border: _addedCarry &&
                                          i != numberOfColumns - 1
                                      ? Border.all(
                                          color: Theme.of(context).primaryColor,
                                          width: 1.0,
                                        )
                                      : null,
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                child: Text(
                                  _addedCarry && i != numberOfColumns - 1
                                      ? "1"
                                      : "",
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
                          ..._userInputs.map(
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _addedCarry = false;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.onPrimary,
                ),
                child: Text('Retirer la retenue'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _addedCarry = true;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[300],
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                ),
                child: Text('Ajouter une retenue'),
              ),
            ],
          ),
          const Divider(),
          const SizedBox(height: 20),
          Numbers(
            onPressed: (value) {
              setState(() {
                _userInputs.removeWhere((element) => element.isEmpty);
                _userInputs.insert(0, value.toString());
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
                      if (_userInputs.isNotEmpty) {
                        for (int i = 0; i < _userInputs.length; i++) {
                          if (_userInputs[i].isNotEmpty) {
                            _userInputs[i] = "";
                            break;
                          }
                        }
                      }
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

                  final isCorrect = _userInputs.join() ==
                      (addState.firstValue + addState.secondValue).toString();

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
                      _userInputs.clear();
                      _addedCarry = false;
                      ref.read(additionProvider.notifier).regenerateNumbers();
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
