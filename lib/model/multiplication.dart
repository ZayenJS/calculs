import 'package:hive_flutter/hive_flutter.dart';

part 'multiplication.g.dart';

@HiveType(typeId: 1)
class Multiplication {
  static const String boxName = 'multiplicationsBox';

  @HiveField(0)
  late int firstValue;

  @HiveField(1)
  late int secondValue;

  @HiveField(2)
  late int? timeTaken;

  @HiveField(3)
  late int attempts;

  @HiveField(4)
  late bool isCorrect;

  @HiveField(5)
  late DateTime createdAt;

  Multiplication({
    required this.firstValue,
    required this.secondValue,
    this.timeTaken,
    required this.attempts,
    required this.isCorrect,
    required this.createdAt,
  });
}
