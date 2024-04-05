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
      HomePageState(
        generateStatus: GenerateStatus.selectApiKey,
        file: imageBytes,
        mimeType: mimeType,
      ),
    );
  }

  // Select ApiKey
  Future<void> selectApiKey() async {}

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
  }
  // Generated Code Success
  // Generate Code Failure
}
