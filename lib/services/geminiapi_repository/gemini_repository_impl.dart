import 'dart:typed_data';

import 'package:code_my_screen/services/geminiapi_repository/geminiapi_failure.dart';
import 'package:code_my_screen/services/geminiapi_repository/geminiapi_repository.dart';
import 'package:code_my_screen/services/geminiapi_repository/geminiapi_service.dart';
import 'package:dartz/dartz.dart';

class GeminiApiRepositoryImpl implements GeminiApiRepository {
  GeminiApiService geminiApiService = GeminiApiService();

  @override
  Future<Either<GenerateContentFailure, String>> generateContent({
    required Uint8List screenshotFile,
    required String mimeType,
    required String apiKey,
  }) async {
    final either = await geminiApiService.generateContent(
      screenshotFile: screenshotFile,
      mimeType: mimeType,
      apiKey: apiKey,
    );

    return either.fold((l) => left(l), (r) {
      return right(r);
    });
  }
}
