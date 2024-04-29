import 'dart:typed_data';

import 'package:code_my_screen/core/constants.dart';
import 'package:code_my_screen/services/geminiapi_repository/geminiapi_repository.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:logging/logging.dart';

class GeminiApiRepositoryImpl implements GeminiApiRepository {
  @override
  Future<GenerateContentResponse> generateContent({
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
    } catch (e) {
      Logger.root.severe('GeminiAPI generate content error');
      throw Exception(e);
    }

    return response;
  }
}
