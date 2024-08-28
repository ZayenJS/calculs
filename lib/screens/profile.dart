import 'package:calculs/model/boxes.dart';
import 'package:calculs/repository/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ProfileRepository.getProfile();
    print("addition ${profile.additions}");
    print("correct addiotion ${profile.correctAdditions}");

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
        ],
      ),
    );
  }
}
