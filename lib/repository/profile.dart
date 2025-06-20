import 'package:calculs/model/boxes.dart';
import 'package:calculs/model/profile.dart';

class ProfileRepository {
  static bool profileExists() {
    return profileBox.isNotEmpty;
  }

  static Profile getProfile() {
    return profileBox.getAt(0);
  }

  static Future<void> createProfile(
      {required String name, String? image = ""}) async {
    final profile = Profile(
      id: 0,
      name: name,
      picture: image!,
      additions: 0,
      correctAdditions: 0,
      subtractions: 0,
      correctSubtractions: 0,
      multiplications: 0,
      correctMultiplications: 0,
      divisions: 0,
      correctDivisions: 0,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    await profileBox.put(
      0,
      profile,
    );
  }

  static Future<void> incrementAdditions() async {
    final profile = profileBox.getAt(0);
    profile.additions++;

    profileBox.putAt(0, profile!);
  }

  static Future<void> incrementCorrectAdditions() async {
    final profile = profileBox.getAt(0);
    profile.correctAdditions++;

    profileBox.putAt(0, profile!);
  }

  static Future<void> incrementMultiplications() async {
    final profile = profileBox.getAt(0);
    profile.multiplications++;

    profileBox.putAt(0, profile!);
  }

  static Future<void> incrementCorrectMultiplications() async {
    final profile = profileBox.getAt(0);
    profile.correctMultiplications++;

    profileBox.putAt(0, profile!);
  }
}
