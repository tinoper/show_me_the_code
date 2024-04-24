import 'dart:async';

import 'package:code_my_screen/core/constants.dart';
import 'package:code_my_screen/core/enums/generate_status.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

part 'home_page_cubit.freezed.dart';
part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit(
    this._filePicker,
  ) : super(
          const HomePageState(
            generateStatus: GenerateStatus.selectScreenshot,
          ),
        );

  final FilePicker _filePicker;
  StreamSubscription<dynamic>? _generateCodeSubscription;

  Future<void> selectFilePressed() async {
    final result = await _filePicker.pickFiles(type: FileType.image);
    if (result == null || result.files.isEmpty) {
      return;
    }
    final file = result.files.first;
    final mimeType =
        file.extension?.toLowerCase() == 'png' ? 'image/png' : 'image/jpeg';
    final imageBytes = file.bytes!;
    emit(
      state.copyWith(
        generateStatus: GenerateStatus.selectApiKey,
        file: imageBytes,
        mimeType: mimeType,
      ),
    );
  }

  Future<void> setApiKey(String updatedApiKey) async {
    emit(
      state.copyWith(
        geminiApiKey: updatedApiKey,
      ),
    );
  }

  Future<void> generateCode() async {
    emit(
      state.copyWith(
        generateStatus: GenerateStatus.generating,
      ),
    );
    unawaited(getCodeFromApi());
  }

  // Use Case
  Future<void> getCodeFromApi() async {
    final GenerationConfig generationConfig = GenerationConfig(
      maxOutputTokens: 4096,
      temperature: 0.4,
      topK: 32,
    );

    final model = GenerativeModel(
      model: Constants.geminiModel,
      apiKey: state.geminiApiKey!,
      generationConfig: generationConfig,
    );

    final content = [
      Content.multi([
        TextPart(Constants.systemPrompt),
        DataPart(state.mimeType!, state.file!),
      ])
    ];

    try {
      final response = await model.generateContent(content);
      if (response.text != null) {
        emit(
          state.copyWith(
            generateStatus: GenerateStatus.generated,
            generatedCode: response.text ?? '',
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          generateStatus: GenerateStatus.error,
          errorMessage: e.toString(),
        ),
      );
      return;
    }
  }

  // Generate Code Failure
  @override
  Future<void> close() {
    _generateCodeSubscription?.cancel();
    return super.close();
  }
}
