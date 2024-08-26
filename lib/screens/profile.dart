import 'package:calculs/providers/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileState = ref.watch(profileProvider);

    return Scaffold(
      body: Column(
        children: [
          Text(
            profileState.profile!.name!,
            style: const TextStyle(fontSize: 24),
          ),
          const Divider(),
          Text(
            "Additions: ${profileState.profile!.additions}",
          ),
          Text(
            "Additions correctes: ${profileState.profile!.correct_additions}",
          ),
        ],
      ),
    );
  }
}
