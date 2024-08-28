import 'package:flutter/material.dart';

class Numbers extends StatelessWidget {
  final void Function(int value) onPressed;

  const Numbers({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                fixedSize: const Size(60, 60),
              ),
              onPressed: () => onPressed(1),
              child: const Text(
                '1',
                style: TextStyle(fontSize: 20),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
                fixedSize: const Size(60, 60),
              ),
              onPressed: () => onPressed(2),
              child: const Text(
                '2',
                style: TextStyle(fontSize: 20),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 206, 103, 224),
                foregroundColor: Colors.white,
                fixedSize: const Size(60, 60),
              ),
              onPressed: () => onPressed(3),
              child: const Text(
                '3',
                style: TextStyle(fontSize: 20),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                fixedSize: const Size(60, 60),
              ),
              onPressed: () => onPressed(4),
              child: const Text(
                '4',
                style: TextStyle(fontSize: 20),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                fixedSize: const Size(60, 60),
              ),
              onPressed: () => onPressed(5),
              child: const Text(
                '5',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                fixedSize: const Size(60, 60),
              ),
              onPressed: () => onPressed(6),
              child: const Text(
                '6',
                style: TextStyle(fontSize: 20),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                foregroundColor: Colors.white,
                fixedSize: const Size(60, 60),
              ),
              onPressed: () => onPressed(7),
              child: const Text(
                '7',
                style: TextStyle(fontSize: 20),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
                fixedSize: const Size(60, 60),
              ),
              onPressed: () => onPressed(8),
              child: const Text(
                '8',
                style: TextStyle(fontSize: 20),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown,
                foregroundColor: Colors.white,
                fixedSize: const Size(60, 60),
              ),
              onPressed: () => onPressed(9),
              child: const Text(
                '9',
                style: TextStyle(fontSize: 20),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
                foregroundColor: Colors.white,
                fixedSize: const Size(60, 60),
              ),
              onPressed: () => onPressed(0),
              child: const Text(
                '0',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
