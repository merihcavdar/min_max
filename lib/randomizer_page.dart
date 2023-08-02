import 'package:flutter/material.dart';
import 'dart:math';

class RandomizerPage extends StatefulWidget {
  const RandomizerPage({super.key, required this.min, required this.max});
  final int min, max;

  @override
  State<RandomizerPage> createState() => _RandomizerPageState();
}

class _RandomizerPageState extends State<RandomizerPage> {
  int? _generatedNumber;
  @override
  Widget build(BuildContext context) {
    final randomGenerator = Random();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Radomizer'),
      ),
      body: Center(
        child: Text(
          _generatedNumber?.toString() ?? 'Generate number',
          style: const TextStyle(fontSize: 42),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            setState(() {
              _generatedNumber = widget.min +
                  randomGenerator.nextInt(widget.max + 1 - widget.min);
            });
          },
          label: const Text('Generate')),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
