import 'package:code_my_screen/core/constants.dart';
import 'package:code_my_screen/home/cubit/home_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomePageCubit>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(Constants.title),
      ),
      body: const Placeholder(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          cubit.generateCode();
          // String apiKey = const String.fromEnvironment('API_KEY');

          // final model =
          //     GenerativeModel(model: Constants.geminiModel, apiKey: apiKey);
          // final imageData = await rootBundle.load(Constants.defaultDataImage);
          // final imageBytes = imageData.buffer.asUint8List();
          // final content = [
          //   Content.multi([
          //     TextPart(Constants.systemPrompt),
          //     DataPart('image/png', imageBytes),
          //   ])
          // ];

          // final response = await model.generateContent(content);
          // print(response.text);
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
