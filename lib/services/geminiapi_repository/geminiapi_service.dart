import 'package:code_my_screen/core/constants.dart';
import 'package:code_my_screen/services/geminiapi_repository/geminiapi_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:logging/logging.dart';

class GeminiApiService {
  GeminiApiService();

  Future<Either<GenerateContentFailure, String>> generateContent({
    required Uint8List screenshotFile,
    required String mimeType,
    required String apiKey,
  }) async {
    final GenerationConfig generationConfig = GenerationConfig(
      maxOutputTokens: 4096,
      temperature: 0.4,
      topK: 32,
    );

    final model = GenerativeModel(
      model: Constants.geminiModel,
      apiKey: apiKey,
      generationConfig: generationConfig,
    );

    final content = [
      Content.multi([
        TextPart(Constants.systemPrompt),
        DataPart(mimeType, screenshotFile),
      ])
    ];
    GenerateContentResponse response;

    try {
      response = await model.generateContent(content);
      return right(response.text!);
    } catch (e) {
      Logger.root.severe('GeminiAPI generate content error');
      return left(
        const GenerateContentFailure(
          'GeminiAPI generate content error',
        ),
      );
    }
  }
}
