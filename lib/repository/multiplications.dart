import 'package:calculs/model/boxes.dart';
import 'package:calculs/model/multiplication.dart';

class MultiplicationsRepository {
  static Future<void> addMultiplication({
    required int firstValue,
    required int secondValue,
    int? timeTaken,
    required int attempts,
    required bool isCorrect,
  }) async {
    final multiplication = Multiplication(
      firstValue: firstValue,
      secondValue: secondValue,
      attempts: attempts,
      isCorrect: isCorrect,
      createdAt: DateTime.now(),
    );

    final i = await multiplicationsBox.add(multiplication);
  }

  static Future<int> getTotalMultiplications() async {
    return multiplicationsBox.length;
  }

  static Future<int> getCorrectMultiplications() async {
    int correctCount = 0;
    for (var multiplication in multiplicationsBox.values) {
      if (multiplication.isCorrect) {
        correctCount++;
      }
    }
    return correctCount;
  }
}
