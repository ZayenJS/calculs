import 'package:calculs/model/boxes.dart';
import 'package:calculs/model/multiplication.dart';
import 'package:calculs/model/profile.dart';
import 'package:calculs/repository/profile.dart';
import 'package:calculs/screens/new_profile.dart';
import 'package:calculs/screens/tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(ProfileAdapter());
  profileBox = await Hive.openBox<Profile>(Profile.boxName);
  Hive.registerAdapter(MultiplicationAdapter());
  multiplicationsBox =
      await Hive.openBox<Multiplication>(Multiplication.boxName);

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    super.initState();
    // ref.read(profileProvider.notifier).loadProfile();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculs',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 12, 8, 244),
        ),
        useMaterial3: true,
      ),
      home: ProfileRepository.profileExists()
          ? const TabsScreen()
          : const NewProfileScreen(),
    );
  }
}
