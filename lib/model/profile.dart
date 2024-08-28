import 'package:hive_flutter/hive_flutter.dart';

part 'profile.g.dart';

@HiveType(typeId: 0)
class Profile {
  static const String boxName = 'profileBox';

  @HiveField(0)
  late int id;

  @HiveField(1)
  late String name;

  @HiveField(2)
  late String picture;

  @HiveField(3)
  late int additions;

  @HiveField(4)
  late int correctAdditions;

  @HiveField(5)
  late int subtractions;

  @HiveField(6)
  late int correctSubtractions;

  @HiveField(7)
  late int multiplications;

  @HiveField(8)
  late int correctMultiplications;

  @HiveField(9)
  late int divisions;

  @HiveField(10)
  late int correctDivisions;

  @HiveField(11)
  late DateTime createdAt;

  @HiveField(12)
  late DateTime updatedAt;

  Profile({
    required this.id,
    required this.name,
    required this.picture,
    required this.additions,
    required this.correctAdditions,
    required this.subtractions,
    required this.correctSubtractions,
    required this.multiplications,
    required this.correctMultiplications,
    required this.divisions,
    required this.correctDivisions,
    required this.createdAt,
    required this.updatedAt,
  });
}
