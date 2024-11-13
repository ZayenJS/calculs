import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class AdditionState {
  final int firstValue;
  final int secondValue;

  AdditionState({required this.firstValue, required this.secondValue});
}

class AdditionNotifier extends StateNotifier<AdditionState> {
  AdditionNotifier()
      : super(
          AdditionState(
            firstValue: Random().nextInt(40),
            secondValue: Random().nextInt(40),
          ),
        );

  void regenerateNumbers() {
    state = AdditionState(
        firstValue: Random().nextInt(40), secondValue: Random().nextInt(40));
  }
}

final additionProvider = StateNotifierProvider<AdditionNotifier, AdditionState>(
  (ref) => AdditionNotifier(),
);
