// Here lies code for json conversion

import '../../domain/entities/translator.dart';

class TranslationModel extends Translation {
  const TranslationModel({
    required String text,
    required String to,
  }) : super(text: text, to: to);

  factory TranslationModel.fromJson(Map<String, dynamic> json) {
    return TranslationModel(
      text: json['text'],
      to: json['to'],
    );
  }
}

class TranslatorResultModel extends TranslationResult {
  const TranslatorResultModel({
    required List<TranslationModel> translations,
  }) : super(translations: translations);

  factory TranslatorResultModel.fromJson(List<dynamic> json) {
    return TranslatorResultModel(
      translations: (json[0]['translations'] as List<dynamic>)
          .map((e) => TranslationModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}