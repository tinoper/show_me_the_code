import 'package:flutter/material.dart';

class GeneratingCode extends StatelessWidget {
  const GeneratingCode({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 10),
          Text('Generating code...'),
        ],
      ),
    );
  }
}
