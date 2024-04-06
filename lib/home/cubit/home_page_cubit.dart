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
    final model = GenerativeModel(
      model: Constants.geminiModel,
      apiKey: state.geminiApiKey!,
    );

    final content = [
      Content.multi([
        TextPart(Constants.systemPrompt),
        DataPart(state.mimeType!, state.file!),
      ])
    ];

    try {
      emit(
        state.copyWith(generateStatus: GenerateStatus.generating),
      );
      final response = await model.generateContent(content);
      emit(
        state.copyWith(
          generateStatus: GenerateStatus.generated,
          generatedCode: response.text,
        ),
      );
    } catch (e) {
      emit(state.copyWith(
        generateStatus: GenerateStatus.error,
        errorMessage: "Error Trying to generate code ${e.toString()}",
      ));
    }
  }
  // Generated Code Success
  // Generate Code Failure
}
