part of 'home_page_cubit.dart';

@freezed
class HomePageState with _$HomePageState {
  const factory HomePageState.selectScreenshot() = _SelectScreenshot;
  const factory HomePageState.generating(
    String apiKey,
    Uint8List imageBytes,
  ) = _Generating;
  const factory HomePageState.generated(
    String? generatedCode,
  ) = _Generated;
  const factory HomePageState.loading() = _Loading;
  const factory HomePageState.error(
    String errorMessage,
  ) = _Error;
}
