import 'package:flutter_riverpod/flutter_riverpod.dart';

class InputNotifier extends StateNotifier<double?> {
  InputNotifier() : super(null);

  void setInput(double? value) {
    state = value;
  }
}

final inputProvider = StateNotifierProvider<InputNotifier, double?>(
  (ref) => InputNotifier(),
);
