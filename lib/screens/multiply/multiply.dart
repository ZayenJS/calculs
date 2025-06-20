import 'package:calculs/screens/multiply/inline_multiply.dart';
import 'package:flutter/material.dart';

class MultiplyScreen extends StatelessWidget {
  const MultiplyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Multiplications",
              style: TextStyle(color: Colors.white)),
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
        body: Column(
          children: [
            const SizedBox(height: 50),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 86, 198, 123),
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const InlineMultiplyScreen(),
                        ),
                      );
                    },
                    child: const Text('Multiplications en ligne'),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
