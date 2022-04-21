import '../models/translator_model.dart';

abstract class TranslatorRemoteDataSource {
  /// Calls the Translator API and returns a [TranslationResultModel]
  ///
  /// Throws a [ServerException] for all error codes.
  Future<TranslationResultModel>? getTranslatedText(String? text);
}
