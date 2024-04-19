part of 'home_page_cubit.dart';

@freezed
class HomePageState with _$HomePageState {
  const factory HomePageState({
    @Default(GenerateStatus.loading) GenerateStatus generateStatus,
    Uint8List? file,
    String? mimeType,
    String? geminiApiKey,
    @Default('') String generatedCode,
    String? errorMessage,
  }) = _HomePageState;
}
