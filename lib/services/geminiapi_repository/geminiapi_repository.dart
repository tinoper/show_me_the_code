import 'package:flutter/services.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

abstract class GeminiApiRepository {
  Future<GenerateContentResponse> generateContent({
    required Uint8List screenshotFile,
    required String mimeType,
    required String apiKey,
  });
}
