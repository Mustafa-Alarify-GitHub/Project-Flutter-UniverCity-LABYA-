import 'package:flutter/material.dart';

class Lodding extends StatelessWidget {
  const Lodding({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
