class GenerateContentFailure implements Exception {
  /// The associated error message.
  final String message;

  const GenerateContentFailure([
    this.message = 'An unknown exception occurred.',
  ]);
}
