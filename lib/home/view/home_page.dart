import 'package:code_my_screen/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:flutter/services.dart' show rootBundle;

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: const Placeholder(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          String apiKey = const String.fromEnvironment('API_KEY');

          final model =
              GenerativeModel(model: Constants.geminiModel, apiKey: apiKey);
          final imageData = await rootBundle.load(Constants.defaultDataImage);
          final imageBytes = imageData.buffer.asUint8List();
          final content = [
            Content.multi([
              TextPart(Constants.systemPrompt),
              DataPart('image/png', imageBytes),
            ])
          ];

          final response = await model.generateContent(content);
          print(response.text);
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
