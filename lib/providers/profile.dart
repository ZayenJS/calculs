import 'package:calculs/model/model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileState {
  Profile? profile;

  ProfileState({
    this.profile,
  });
}

class ProfileNotifier extends StateNotifier<ProfileState> {
  ProfileNotifier() : super(ProfileState());

  Future<Profile?> loadProfile() async {
    final profile = await Profile(id: 1).select().toSingle();

    state = ProfileState(profile: profile);

    print(profile?.toJson());

    return profile;
  }

  Future<void> createProfile({required String name, String? image = ""}) async {
    final profile = Profile();
    profile.id = 1;
    profile.name = name;
    profile.picture = image;
    profile.created_at = DateTime.now();
    profile.updated_at = DateTime.now();

    await profile.upsert();
    await loadProfile();
  }

  Future<void> incrementAdditions() async {
    if (state.profile != null) {
      Profile(
        id: state.profile!.id,
        name: state.profile!.name,
        additions: (state.profile!.additions ?? 0) + 1,
        created_at: state.profile!.created_at,
        updated_at: DateTime.now(),
      ).save();
      await loadProfile();
    }
  }

  void incrementCorrectAdditions() async {
    if (state.profile != null) {
      Profile(
        id: state.profile!.id,
        name: state.profile!.name,
        correct_additions: (state.profile!.correct_additions ?? 0) + 1,
        created_at: state.profile!.created_at,
        updated_at: DateTime.now(),
      ).save();
      await loadProfile();
    }
  }
}

final profileProvider = StateNotifierProvider<ProfileNotifier, ProfileState>(
  (ref) => ProfileNotifier(),
);
