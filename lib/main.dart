import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:flutter/services.dart' show rootBundle;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigoAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'CodeMyScreen'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
              GenerativeModel(model: 'gemini-pro-vision', apiKey: apiKey);
          final imageData =
              await rootBundle.load('assets/screenshots/inmate_list.png');
          final imageBytes = imageData.buffer.asUint8List();
          final content = [
            Content.multi([
              TextPart(_systemPrompt),
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

const _systemPrompt = '''
You are an expert developer specialized in implementing Flutter apps using Dart.

I will provide you with an image of a reference design and some instructions and it will be your job to implement the corresponding app using Flutter and Dart.

- Pay close attention to background color, text color, font size, font family, padding, margin, border, etc. in the design. Match the colors and sizes exactly.
- If it contains text, use the exact text in the design.
- Repeat elements as needed to match the screenshot. For example, if there are 15 items, the code should have 15 items. DO NOT LEAVE comments like "// Repeat for each item".
- For images, use placeholder images from https://placehold.co and include a detailed description of the image in a `description` query parameter so that an image generation AI can generate the image later (e.g. https://placehold.co/40x40?description=An%20image%20of%20a%20cat).

Try your best to figure out what the designer and product owner want and make it happen. If there are any questions or underspecified features, use what you know about applications, user experience, and app design patterns to "fill in the blanks". If you're unsure of how the designs should work, take a guess—it's better for you to get it wrong than to leave things incomplete.

Technical details:
- Use Dart with null safety
- Variables that are initialized later should be declared as `late` (e.g. `late AnimationController controller;`)
- Mind that context can be accessed during `initState`, if you need it wrap the code with `Future.microtask(() => ...)` to be able to access it.
- If you need to assign an `int` to a `double` variable use `toDouble()`
- Use Material 3
- Set debugShowCheckedModeBanner to false in MaterialApp
- Use only official Flutter packages unless otherwise specified

RETURN ONLY THE CODE FOR THE `main.dart` FILE wrapped in a Markdown code block (```dart {CODE} ```).
Don't include any explanations or comments.

Remember: you love your designers and POs and want them to be happy. The more complete and impressive your app, the happier they will be. Let's think step by step. Good luck, you've got this!`''';
