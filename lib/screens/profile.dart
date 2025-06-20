import 'package:calculs/repository/multiplications.dart';
import 'package:calculs/repository/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ProfileRepository.getProfile();

    return Scaffold(
      body: Column(
        children: [
          Text(
            profile.name ?? "",
            style: const TextStyle(fontSize: 24),
          ),
          const Divider(),
          Text(
            "Additions: ${profile.additions}",
          ),
          Text(
            "Additions correctes: ${profile.correctAdditions}",
          ),
          FutureBuilder<int>(
            future: MultiplicationsRepository.getTotalMultiplications(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Text("Multiplications: Chargement...");
              } else if (snapshot.hasError) {
                return Text("Multiplications: Erreur");
              } else {
                return Text("Multiplications: ${snapshot.data}");
              }
            },
          ),
          FutureBuilder<int>(
            future: MultiplicationsRepository.getCorrectMultiplications(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Text("Multiplications correctes: Chargement...");
              } else if (snapshot.hasError) {
                return Text("Multiplications correctes: Erreur");
              } else {
                return Text("Multiplications correctes: ${snapshot.data}");
              }
            },
          ),
        ],
      ),
    );
  }
}
