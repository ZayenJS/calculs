import 'package:calculs/providers/profile.dart';
import 'package:calculs/screens/tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class NewProfileScreen extends ConsumerStatefulWidget {
  const NewProfileScreen({super.key});

  @override
  ConsumerState<NewProfileScreen> createState() => _NewProfileScreenState();
}

class _NewProfileScreenState extends ConsumerState<NewProfileScreen> {
  late TextEditingController _nameController;
  final Widget _createProfileText = const Text('Créer le profil');
  Widget _buttonContent = const Text('Créer le profil');
  XFile? _pickedFile;

  @override
  void initState() {
    super.initState();

    _nameController = TextEditingController();
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile == null) {
      return;
    }

    setState(() {
      _pickedFile = pickedFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "Bienvenue dans Calculs",
                style: TextStyle(
                  fontSize:
                      Theme.of(context).textTheme.headlineMedium!.fontSize,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            const Text('Crée ton profil pour commencer à jouer!'),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 20),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Ton nom',
                border: OutlineInputBorder(),
              ),
            ),
            // const SizedBox(height: 20),
            // ElevatedButton(
            //   onPressed: _pickImage,
            //   child: const Text('Choisir une photo'),
            // ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                try {
                  setState(() {
                    _buttonContent = const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(),
                    );
                  });
                  await ref.read(profileProvider.notifier).createProfile(
                        name: _nameController.text,
                        image: "",
                      );

                  await Future.delayed(
                    const Duration(milliseconds: 500),
                    () {
                      if (context.mounted) {
                        setState(() {
                          _buttonContent = _createProfileText;
                        });
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (ctx) => const TabsScreen(),
                          ),
                        );
                      }
                    },
                  );
                } catch (e) {
                  setState(() {
                    _buttonContent = _createProfileText;
                  });
                }
              },
              child: _buttonContent,
            ),
          ],
        ),
      ),
    );
  }
}
