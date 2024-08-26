import 'dart:io';

import 'package:calculs/model/model.dart';
import 'package:calculs/providers/profile.dart';
import 'package:calculs/screens/new_profile.dart';
import 'package:calculs/screens/tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final bool isInitialized = await DbModel().initializeDB();
  if (isInitialized == true) {
    runApp(const ProviderScope(child: MyApp()));
  } else {
    print('Error initializing the database');
    exit(1);
  }
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
    ref.read(profileProvider.notifier).loadProfile();
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
      home: FutureBuilder(
        future: ref.watch(profileProvider.notifier).loadProfile(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }

          if (snapshot.data == null) {
            return const NewProfileScreen();
          }

          return const TabsScreen();
        },
      ),
    );
  }
}
