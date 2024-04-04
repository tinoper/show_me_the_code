import 'package:code_my_screen/core/constants.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

part 'home_page_cubit.freezed.dart';
part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit()
      : super(
          const HomePageState.loading(),
        );

  // Load ApiKey
  // Select Image
  Future<void> selectFilePressed() async {
    // file Picker
    // if file null return;
    return;
    // if file not null emit generating, next status
  }

  // Generate Code event
  Future<void> generateCode() async {
    String apiKey = const String.fromEnvironment('API_KEY');

    final model = GenerativeModel(model: Constants.geminiModel, apiKey: apiKey);
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

    emit(HomePageState.generated(response.text));
  }
  // Generated Code Success
  // Generate Code Failure
}
