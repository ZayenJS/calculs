import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class AdditionState {
  final int firstValue;
  final int secondValue;
  final bool carry;

  AdditionState({
    required this.firstValue,
    required this.secondValue,
    this.carry = false,
  });
}

int firstValue = Random().nextInt(40);
int secondValue = Random().nextInt(40);
bool carry = int.parse(firstValue.toString().split('').last) +
        int.parse(secondValue.toString().split('').last) >
    9;

class AdditionNotifier extends StateNotifier<AdditionState> {
  AdditionNotifier()
      : super(
          AdditionState(
            firstValue: firstValue,
            secondValue: secondValue,
            carry: carry,
          ),
        );

  void regenerateNumbers() {
    firstValue = Random().nextInt(40);
    secondValue = Random().nextInt(40);
    carry = int.parse(firstValue.toString().split('').last) +
            int.parse(secondValue.toString().split('').last) >
        9;

    state = AdditionState(
      firstValue: firstValue,
      secondValue: secondValue,
      carry: carry,
    );
  }
}

final additionProvider = StateNotifierProvider<AdditionNotifier, AdditionState>(
  (ref) => AdditionNotifier(),
);
