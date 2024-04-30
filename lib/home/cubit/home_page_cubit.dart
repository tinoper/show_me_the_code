import 'dart:async';

import 'package:code_my_screen/core/enums/generate_status.dart';
import 'package:code_my_screen/services/geminiapi_repository/geminiapi_repository.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_page_cubit.freezed.dart';
part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit(
    this._filePicker,
    this._geminiApiRepository,
  ) : super(
          const HomePageState(
            generateStatus: GenerateStatus.selectScreenshot,
          ),
        );

  final FilePicker _filePicker;
  final GeminiApiRepository _geminiApiRepository;

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
    unawaited(_getCodeFromApi());
  }

  void onBackButtonPressed() {
    final currentStatus = state.generateStatus;
    if (currentStatus.index <= GenerateStatus.selectScreenshot.index) {
      return;
    }

    final updatedStatus = GenerateStatus.values[currentStatus.index - 1];
    emit(state.copyWith(generateStatus: updatedStatus));
  }

  void onStartOverPressed() {
    emit(
      state.copyWith(
        generateStatus: GenerateStatus.selectScreenshot,
        generatedCode: '',
        errorMessage: '',
      ),
    );
  }

  // Main Use Case
  Future<void> _getCodeFromApi() async {
    if (state.file == null ||
        state.mimeType == null ||
        state.geminiApiKey == null) {
      return;
    }

    final responseEither = await _geminiApiRepository.generateContent(
      screenshotFile: state.file!,
      mimeType: state.mimeType!,
      apiKey: state.geminiApiKey!,
    );

    responseEither.fold(
        (l) => emit(
              state.copyWith(
                generateStatus: GenerateStatus.error,
                errorMessage: l.toString(),
              ),
            ), (response) {
      emit(
        state.copyWith(
          generateStatus: GenerateStatus.generated,
          generatedCode: response,
        ),
      );
    });
  }
}
