import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class MultiplicationState {
  final int firstValue;
  final int secondValue;

  MultiplicationState({required this.firstValue, required this.secondValue});
}

int firstValue = Random().nextInt(9) + 2;
int secondValue = Random().nextInt(9) + 2;

class MultiplicationNotifier extends StateNotifier<MultiplicationState> {
  MultiplicationNotifier()
      : super(
          MultiplicationState(
            firstValue: firstValue,
            secondValue: secondValue,
          ),
        );

  void regenerateNumbers() {
    firstValue = Random().nextInt(9) + 2;
    secondValue = Random().nextInt(9) + 2;

    state = MultiplicationState(
      firstValue: firstValue,
      secondValue: secondValue,
    );
  }
}

final multiplicationProvider =
    StateNotifierProvider<MultiplicationNotifier, MultiplicationState>(
  (ref) => MultiplicationNotifier(),
);
