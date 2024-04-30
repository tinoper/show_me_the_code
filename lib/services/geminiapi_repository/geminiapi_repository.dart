import 'package:code_my_screen/services/geminiapi_repository/geminiapi_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';

abstract class GeminiApiRepository {
  Future<Either<GenerateContentFailure, String>> generateContent({
    required Uint8List screenshotFile,
    required String mimeType,
    required String apiKey,
  });
}
