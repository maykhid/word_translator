import '../../domain/entities/translator.dart';
import '../models/translator_model.dart';

abstract class TranslatorRemoteDataSource {
  /// Calls the Translator API and returns a [TranslatorResultModel]
  ///
  /// Throws a [ServerException] for all error codes.
  Future<TranslatorResultModel>? getTranslatedText(String? text);
}
